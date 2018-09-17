//
//  DiscardableStringCacheItem.swift
//  TopChartStore
//
//  Created by Casique, Johan on 17/09/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

class DiscardableStringCacheItem: NSObject, NSDiscardableContent {
    
    private(set) public var data: Data?
    var accesCount: uint = 0
    
    public init(text: Data) {
        self.data = text
    }
    
    func beginContentAccess() -> Bool {
        if data == nil {
            return false
        }
        accesCount += 1
        return true
    }
    
    func endContentAccess() {
        if accesCount > 0 {
            accesCount -= 1
        }
    }
    
    func discardContentIfPossible() {
        if accesCount == 0 {
            data = nil
        }
    }
    
    func isContentDiscarded() -> Bool {
        return data == nil
    }
    
}
