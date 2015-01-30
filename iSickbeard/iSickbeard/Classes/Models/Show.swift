//
//  Show.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

class Show: Printable  {
    
    var name:String
    
    // MARK: - Lifecycle
    
    init(name:String){
        
        self.name     = name
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[Show name: \(self.name)]"
    }
}

