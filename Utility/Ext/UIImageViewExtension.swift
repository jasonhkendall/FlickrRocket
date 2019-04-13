//
//  UIImageViewExtension.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import Foundation
import UIKit




// Path error, corrected and now colocated within extensions folder
// Extension and create circle for UI nav
extension UIImageView
{
    func createCircularImage()
    {
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.clipsToBounds = true;
    }
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
