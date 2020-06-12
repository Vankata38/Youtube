//
//  Response.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    // Property
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        // Used to pass in the decoder
        case items
        
    }
 
    // Initialise decoding
    init(from decoder: Decoder) throws {
        
        // Get the main container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}
