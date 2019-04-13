//
//  CollectionCell.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import UIKit
//

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProfile.createCircularImage()
    }
    
}
