//
//  Episode.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation
import SwiftyJSON

class Episode: DictionaryConvertible {
    
    var name:String
    var airs:NSDate?
    var airdate:NSDate?
    var file_size:Int           = 0
    var location:String         = ""
    var quality:QualitySetting  = QualitySetting.QualitySettingNA
    var status:EpisodeStatus    = EpisodeStatus.EpisodeStatusNA
    var release_name:String?
    var subtitles:Array<String> = []
    var seasonNumber:Int        = 0
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
    
    init(name:String, seasonNumber:Int, airDate:NSDate) {

        self.name         = name
        self.airdate      = airDate
        self.seasonNumber = seasonNumber
    }
    
    // MARK: - Private
    
    func updateSubtitles(subtitlesString:String) {
        
        for subtitleCode in subtitlesString.componentsSeparatedByString(","){
            
            self.subtitles.append(subtitleCode.trim())
            
        }
    }
    
    // MARK: - DictionaryConvertible methods
    
    class func convertFromDictionary(dictionary: JSON) -> Episode? {
        
        var airDate:NSDate? // tmp vars
        var airs:NSDate?    // to save NSDates
        var airString:String?
        var season:Int = 0
        
        airDate = self.simpleDateFormatter.dateFromString(dictionary["airdate"].stringValue)
        
        season = dictionary["season"].intValue
        
        var episode = Episode( // create EP object
            
            name: dictionary["name"].stringValue,
            seasonNumber: season,
            airDate: airDate!
        )
        
        episode.airs = self.nextWeekdayDateFormatter.dateFromString(dictionary["airs"].stringValue)
        
        var showname = dictionary["show_name"]
        
        let copiedShow = Dictionary<String, AnyObject>.pick(
            dictionary.dictionaryObject!, keys:
            
            JSONConstants.ShowKeys.jsonShowNameKey,
            JSONConstants.ShowKeys.jsonIndexerIdKey,
            JSONConstants.ShowKeys.jsonAirsKey,
            JSONConstants.ShowKeys.jsonLocationKey,
            JSONConstants.GeneralKeys.jsonQualityKey,
            JSONConstants.ShowKeys.jsonShowStatusKey,
            JSONConstants.ShowKeys.jsonNetworkKey,
            JSONConstants.ShowKeys.jsonPausedKey,
            JSONConstants.ShowKeys.jsonNetworkKey,
            JSONConstants.ShowKeys.jsonLanguageKey,
            JSONConstants.GeneralKeys.jsonTvdbIdKey
        )
        
        var clonedEpisode = JSON(copiedShow)
        episode.show = Show.convertFromDictionary(clonedEpisode)
        
        // TODO: let parse the other missing props
        
        return episode
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[Show name: \(self.name), airs: \(self.airs), show: \(self.show)]"
    }
}
