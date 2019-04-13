//
//  Utility.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import Foundation
import UIKit

class Utility
{
    static func isValidEmail(testStr: String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func isValidPassword(password:String) -> Bool{
        if(password.count < 6 ){
            return false
        }
        return true
    }
    
    static func getDefaultColor() -> UIColor{
        return UIColor(red: 66.0/255.0, green: 116.0/255.0, blue: 186.0/255.0, alpha: 1.0)
    }
    
    static func showAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "", message:message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }

    
    static func path() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let path = documentsPath?.appending("/User")
        return path!
    }
}
