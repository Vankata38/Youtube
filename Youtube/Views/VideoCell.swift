//
//  VideoCell.swift
//  Youtube
//
//  Created by Ivan Terziev on 17.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var date: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }
    
    func setCell(_ v: Video) {
        
        // Set title and video
        self.video = v
        self.title.text = video?.title
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Convert and set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        self.date.text = dateFormatter.string(from: video!.published)
        
        // Ensure that we have a thumbnail url
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the image
            self.thumbnailImage.image = UIImage(data: cachedData)
            return
            
        }
        
        // Download the thumbnail
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
             
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                // Check the url
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageView
                DispatchQueue.main.async {
                    self.thumbnailImage.image = image
                }
            }
        }
        // Start the data task
        dataTask.resume()
    }
}
