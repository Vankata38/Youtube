//
//  Model.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import Foundation

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos() {
        
        // Create a URL
        let url = URL(string: Constants.apiURL)
        guard url != nil else {
            print("API call failed")
            return
        }
        
        // Get a URLSession
        let session = URLSession.shared
        
        // Get a data task from the URLSession
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for errors
            if error != nil || data == nil {
                return
            }
            
            // Try parsing the data
            do {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                // This all the data returned by the API
                let response = try decoder.decode(Response.self, from: data!)
                
                // If there are videos pass them to MainVC
                if response.items != nil {
                    
                    // Use the main thread to pass the videos
                    DispatchQueue.main.async {
                        // Call the videosFetched method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
                
            } catch {
                print(error)
            }
        }
        // Kick off the task
        dataTask.resume()
    }
}
