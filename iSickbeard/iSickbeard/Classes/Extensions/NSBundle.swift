//
//  NSBundle.swift
//  iSickbeard
//
//  Created by Carlos Santos on 08/06/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

extension NSBundle {
    
    class var applicationVersionNumber: String {
        
        if let version = NSBundle.mainBundle().infoDictionary?["CFBundleShortVersionString"] as? String {
            
            return version
        }
        
        return "Version Number Not Available"
    }
    
    class var applicationBuildNumber: String {
        
        if let build = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String {
            
            return build
        }
        
        return "Build Number Not Available"
    }
}