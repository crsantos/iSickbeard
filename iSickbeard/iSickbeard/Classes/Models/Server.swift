//
//  Server.swift
//  iSickbeard
//
//  Created by Carlos Santos on 30/01/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

/**
*  @brief  Sickbeard Server model representation
*/
class Server: Printable  {
    
    var name:String
    var address:String
    var apiKey:String
    
    // MARK: - Lifecycle
    
    init(name:String, address:String, apiKey:String){

        self.name    = name
        self.address = address
        self.apiKey  = apiKey;
    }
    
    // MARK: - Public
    
    var description : String {
        
        return "[ServerName: \(self.name), Host: \(self.address), APIKey: \(self.apiKey)]"
    }
}
