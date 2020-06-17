//
//  CacheManager.swift
//  Youtube
//
//  Created by Ivan Terziev on 17.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {

        // Stire the image data with url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
        
    }
}
