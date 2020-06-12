//
//  Constants.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import Foundation

struct Constants {
    
    static var apiKey = "AIzaSyA6oKMZuSGaRyQXQ0Tw5H9O2AZOZVuVK5k"
    static var playlistID = "UUffdZGxiVRy3i9EaZF4m0wA"
    static var apiURL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.playlistID)&key=\(Constants.apiKey)"
    
}
