//
//  Constants.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import Foundation

struct Constants {
    
    static var apiKey = ""
    static var playlistID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var apiURL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.playlistID)&key=\(Constants.apiKey)"
    
}
