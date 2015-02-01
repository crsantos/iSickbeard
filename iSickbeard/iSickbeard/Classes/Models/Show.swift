//
//  Show.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

class Show: Printable  {
    
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
    
    // MARK: - Public
    
    var description : String {
        
        return "[[\(self.indexerId)) Show name: \(self.name), quality: \(self.quality.rawValue), airs: \(self.airs), location: \(self.location)]"
    }
}

