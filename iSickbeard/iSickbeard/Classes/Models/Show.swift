//
//  Show.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

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
    
    class func convertFromDictionary(dictionary: Dictionary<String, AnyObject>) -> Show? {
        
        var show = Show(
            
            name: dictionary["show_name"] as String,
            indexerId: Int64(dictionary["indexerid"] as Int!),
            airs: dictionary["airs"] as String,
            location: dictionary["location"] as String,
            quality: QualitySetting(rawValue:dictionary["quality"] as String)!
        )
        
        if let status = dictionary["status"] as String{
            
            Show
        }
        
        return show
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[[\(self.indexerId)) Show name: \(self.name), quality: \(self.quality.rawValue), airs: \(self.airs), location: \(self.location)]"
    }
}

