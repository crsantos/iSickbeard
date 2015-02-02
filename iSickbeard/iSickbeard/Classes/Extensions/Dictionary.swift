//
//  Dictionary.swift
//  iSickbeard
//
//  Created by Carlos Santos on 02/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /**
    Picks the target keys from the dictionary and generates a new one
    
    :param: dictionary the original dictionary
    :param: keys       the keys to copy
    
    :returns: a new dict with the copied keys
    */
    static func pick<K, V>(dictionary: [K: V], keys: K...) -> [K: V] {
        
        var result : [K: V] = [K: V]()
        for key in keys {
            
            result[key] = dictionary[key]
        }
        return result
    }
}