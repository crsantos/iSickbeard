//
//  Extensions.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

extension String {
    
    func trim() -> String {
        
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func trim(withSet: NSCharacterSet) -> String {
        
        return self.stringByTrimmingCharactersInSet(withSet)
    }
}
