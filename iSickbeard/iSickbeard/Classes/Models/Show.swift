//
//  Show.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

class Show: Printable  {
    
    var name:String
    
    var quality:QualitySetting
    
    
    // MARK: - Lifecycle
    
    init(name:String, quality:QualitySetting){
        
        self.name    = name
        self.quality = quality
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[Show name: \(self.name), quality: \(self.quality.rawValue)]"
    }
}

