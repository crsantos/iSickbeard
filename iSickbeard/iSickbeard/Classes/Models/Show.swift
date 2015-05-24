//
//  Show.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import SwiftyJSON

class Show: Printable, DictionaryConvertible  {
    
    var name:String
    var airs:String
    var quality:QualitySetting
    var genre:Array<String> = []
    var location:String
    var indexerId:Int64
    
    // MARK: - Lifecycle
    
    init(name:String, indexerId:Int64, airs:String, location:String, quality:QualitySetting){
        
        self.name      = name
        self.quality   = quality
        self.airs      = airs
        self.location  = location
        self.indexerId = indexerId
    }
    
    // MARK: - DictionaryConvertible methods
    
    class func convertFromDictionary(dictionary: JSON) -> Show? {
        
        var qualitySetting:QualitySetting = .QualitySettingNA
        
        if let quality = QualitySetting(rawValue:dictionary["quality"].stringValue){

            qualitySetting = quality
        }
        
        var show = Show(
            
            name: dictionary["show_name"].stringValue,
            indexerId: Int64(dictionary["indexerid"].intValue),
            airs: dictionary["airs"].stringValue,
            location: dictionary["location"].stringValue,
            quality: qualitySetting
        )
        
        // TODO: let parse the other missing props
        
        return show
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[[\(self.indexerId)) Show name: \(self.name), quality: \(self.quality.rawValue), airs: \(self.airs), location: \(self.location)]"
    }
}

