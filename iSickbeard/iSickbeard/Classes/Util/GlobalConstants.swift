//
//  GlobalConstants.swift
//  iSickbeard
//
//  Created by Carlos Santos on 24/05/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

struct JSONConstants {
    
    struct GeneralKeys {

        static let jsonDataKey       = "data"
        static let jsonQualityKey    = "quality"
        static let jsonTvdbIdKey     = "tvdbid"
        static let jsonEpisodesKey  = "episodes"
    }

    struct ShowKeys {

        static let jsonShowNameKey   = "show_name"
        static let jsonIndexerIdKey  = "indexerid"
        static let jsonAirsKey       = "airs"
        static let jsonShowStatusKey = "show_status"
        static let jsonNetworkKey    = "network"
        static let jsonPausedKey     = "paused"
        static let jsonLanguageKey   = "language"
        
    }

    struct EpisodeKeys {

        static let jsonEpisodeNameKey         = "name"
        static let jsonEpisodeAirDateKey      = "airdate"
        static let jsonEpisodeSeasonKey       = "season"
        static let jsonEpisodeStatusKey       = "status"
        static let jsonEpisodeKey             = "episode"
        static let jsonEpisodeLocationKey     = "location"
        static let jsonEpisodeResourcePathKey = "resource_path"
        static let jsonEpisodeResourceKey = "resource"
    }
}