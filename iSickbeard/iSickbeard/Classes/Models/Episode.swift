//
//  Episode.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation
import SwiftyJSON

class Episode: Printable, DictionaryConvertible {
    
    var name:String
    var airs:NSDate?
    var airDate:NSDate?
    var file_size:Int           = 0
    var location:String         = ""
    var quality:QualitySetting  = QualitySetting.QualitySettingNA
    var status:EpisodeStatus    = EpisodeStatus.EpisodeStatusNA
    var release_name:String?
    var resourcePath:String?
    var resource:String?
    var subtitles:Array<String> = []
    var seasonNumber:Int        = 0
    var episodeNumber:Int       = 0
    var weekday:Int             = 0
    var show:Show?
    
    class var simpleDateFormatter: NSDateFormatter {
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
     class var nextWeekdayDateFormatter: NSDateFormatter {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, h:mm a"
        return dateFormatter
    }
    
    // MARK: - Lifecycle
    
    init(name:String, seasonNumber:Int, episodeNumber:Int) {

        self.name          = name
        self.seasonNumber  = seasonNumber
        self.episodeNumber = episodeNumber
    }
    
    // MARK: - Private
    
    func updateSubtitles(subtitlesString:String) {
        
        for subtitleCode in subtitlesString.componentsSeparatedByString(","){
            
            self.subtitles.append(subtitleCode.trim())
            
        }
    }
    
    // MARK: - DictionaryConvertible methods
    
    class func convertFromDictionary(dictionary: JSON) -> Episode? {
        
        var episode = Episode( // create EP object
            
            name: dictionary[JSONConstants.EpisodeKeys.jsonEpisodeNameKey].stringValue,
            seasonNumber: dictionary[JSONConstants.EpisodeKeys.jsonEpisodeSeasonKey].intValue,
            episodeNumber: dictionary[JSONConstants.EpisodeKeys.jsonEpisodeKey].intValue
        )
        
        episode.location     = dictionary[JSONConstants.EpisodeKeys.jsonEpisodeLocationKey].stringValue
        episode.resourcePath = dictionary[JSONConstants.EpisodeKeys.jsonEpisodeResourcePathKey].stringValue
        episode.resource     = dictionary[JSONConstants.EpisodeKeys.jsonEpisodeResourceKey].stringValue
        
        if let airDate = self.simpleDateFormatter.dateFromString(dictionary[JSONConstants.EpisodeKeys.jsonEpisodeAirDateKey].stringValue) {
            
            episode.airDate = airDate
        }
        
        if let airs = self.nextWeekdayDateFormatter.dateFromString(dictionary["airs"].stringValue){
            
            episode.airs = airs
        }
        
        if let status = EpisodeStatus(rawValue:dictionary[JSONConstants.EpisodeKeys.jsonEpisodeStatusKey].stringValue){

            episode.status = status
        }
        
        if let quality = QualitySetting(rawValue:dictionary[JSONConstants.GeneralKeys.jsonQualityKey].stringValue){
            
            episode.quality = quality
        }
        
        let copiedShow = Dictionary<String, AnyObject>.pick(
            dictionary.dictionaryObject!, keys:
            
            JSONConstants.ShowKeys.jsonShowNameKey,
            JSONConstants.ShowKeys.jsonIndexerIdKey,
            JSONConstants.ShowKeys.jsonAirsKey,
            JSONConstants.GeneralKeys.jsonQualityKey,
            JSONConstants.ShowKeys.jsonShowStatusKey,
            JSONConstants.ShowKeys.jsonNetworkKey,
            JSONConstants.ShowKeys.jsonPausedKey,
            JSONConstants.ShowKeys.jsonNetworkKey,
            JSONConstants.ShowKeys.jsonLanguageKey,
            JSONConstants.GeneralKeys.jsonTvdbIdKey
        )
        
        var clonedShow = JSON(copiedShow)
        episode.show = Show.convertFromDictionary(clonedShow)
        
        // TODO: let parse the other missing props
        
        return episode
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[Episode name: \(self.name), airs: \(self.airs), show: \(self.show)]"
    }
}
