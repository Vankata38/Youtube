//
//  ViewController.swift
//  Youtube
//
//  Created by Ivan Terziev on 13.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    
    // MARK: - App lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Get the videos
        model.getVideos()
        
    }
    
    // MARK: - Methods
    
}
