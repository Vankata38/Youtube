//
//  Video.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import Foundation

struct Video: Decodable {
    
    // Properties
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        // Needed to access the other keys
        case snippet
        case thumbnails
        case high
        case resourceId
        
        // Specify the keys used to store the needed properties
        case videoId
        case title
        case description
        case thumbnail = "url"
        case published = "publishedAt"
        
    }
    
    // Initialise JSON decoding
    init (from decoder: Decoder) throws {
        
        // Get the snippet container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
     
        // Parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse the discription
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
    
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    
        // Parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    
    }
}
