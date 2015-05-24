//
//  DictionaryConvertible.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol DictionaryConvertible {
    
    typealias Result
    
    static func convertFromDictionary(dictionary:JSON) -> Result?
}
