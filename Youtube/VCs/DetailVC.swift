//
//  DetailVC.swift
//  Youtube
//
//  Created by Ivan Terziev on 26.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var textView: UITextView!
    var video: Video?
    
    // MARK: - LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Clear everything
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard video != nil else {
            return
        }
        
        // Create the URL
        let embedURL = Constants.youtubeEmbedURL + video!.videoId
        
        // Load it into the webview
        let url = URL(string: embedURL)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        self.dateLabel.text = dateFormatter.string(from: video!.published)
        
        // Set the description
        textView.text = video!.description
    }
}
