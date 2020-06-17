//
//  ViewController.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    
    
    // MARK: - App lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Assign the MainVC as the data source and the delegate of the tableView
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set the MainVC as the delegate of the model
        model.delegate = self
        
        // Get the videos
        model.getVideos()
        
    }
    
    
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to videos property
        self.videos = videos
        
        //Refresh the tableview
        tableView.reloadData()
        
    }
    
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellID, for: indexPath) as! VideoCell
        
        // Get the video
        let video = self.videos[indexPath.row]
        
        // Configure the cell
        cell.setCell(video)
        
        // Return the cell
        return cell
        
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
