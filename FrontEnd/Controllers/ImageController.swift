//
//  ImageController.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import UIKit

class ImageController: UIViewController {
    /// Image cont outlets
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var imageTitle: String?
    var imgURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadDate()
    }
    
    
    // Req - Cached Images to enhance/reduce loading time
    func loadDate() {
        if let TIT = imageTitle {
            lblTitle.text = TIT
        }
        if let url = imgURL {
            imgView.loadImageUsingCacheWithUrlString(url)
        }
    }
    
}
