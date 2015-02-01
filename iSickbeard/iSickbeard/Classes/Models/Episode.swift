//
//  Episode.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

class Episode {
    
    var name:String
    var airdate:NSDate
    var file_size:Int           = 0
    var location:String         = ""
    var quality:QualitySetting  = QualitySetting.QualitySettingNA
    var status:EpisodeStatus    = EpisodeStatus.EpisodeStatusNA
    var release_name:String?
    var subtitles:Array<String> = []
    var seasonNumber:Int
    
    init(name:String, seasonNumber:Int, airDate:NSDate) {

        self.name         = name
        self.airdate      = airDate
        self.seasonNumber = seasonNumber
    }
    
    func updateSubtitles(subtitlesString:String) {
        
        for subtitleCode in subtitlesString.componentsSeparatedByString(","){
            
            self.subtitles.append(subtitleCode.trim())
            
        }
        
    }
}
