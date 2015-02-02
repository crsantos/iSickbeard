//
//  Episode.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

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
    
    class func convertFromDictionary(dictionary: Dictionary<String, AnyObject>) -> Episode? {
        
        var airDate:NSDate? // tmp vars
        var airs:NSDate?    // to save NSDates
        var airString:String?
        var season:Int = 0
        
        if let airdateStr:String = dictionary["airdate"] as? String{
            
            airDate = self.simpleDateFormatter.dateFromString(airdateStr)
        }
        
        if let airsStr:String = dictionary["airs"] as? String {
            
            airString = airsStr
            airs = self.nextWeekdayDateFormatter.dateFromString(airsStr)
        }
        
        if let seasonStr = dictionary["season"] as? String{
            
            season = seasonStr.toInt()!
        }
        
        var episode = Episode( // create EP object
            
            name: dictionary["name"] as String,
            seasonNumber: season,
            airDate: airDate!
        )
        
        if let epName:String = dictionary["ep_name"] as? String {

            episode.name = epName // override name with ep_name if it exists
        }
        
        if airs != nil {

            episode.airs = airs!
        }
        
        if let showname = dictionary["show_name"] as? String{
            
            // TODO: refactor this to reuse Show.convert.. 
            //       from a sub-dict created from target keys
            //       like newDict = dictionary.pick("show_name", "indexerid")
            
            // get show data if available
            episode.show = Show(
                name: showname,
                indexerId: Int64(dictionary["indexerid"] as Int!),
                airs: airString!,
                location: "",
                quality: QualitySetting(rawValue:dictionary["quality"] as String)!
            )
        }
        // TODO: let parse the other missing props
        
        return episode
    }
}
