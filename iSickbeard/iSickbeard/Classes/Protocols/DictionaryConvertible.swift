//
//  DictionaryConvertible.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

public protocol DictionaryConvertible {
    
    typealias Result
    
    class func convertFromDictionary(dictionary:Dictionary<String,AnyObject>) -> Result?
}
