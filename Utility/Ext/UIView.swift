//
//  UIView.swift
//  FlickrRocket
//
//  Created by Jason Howard Kendall on 4/7/19.
//  Copyright © 2019 Jason Howard Kendall. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        
        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        
        return nil
    }
    
    func shake(count : Float = 2,for duration : TimeInterval = 0.1,withTranslation translation : Float = 2) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
    func pushTransition(_ duration:CFTimeInterval) {
        self.transform = .identity
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.push.rawValue)
        self.isHidden = false
    }
    
}

extension UIView{
    
    func animShow(_ duration:CFTimeInterval){
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {

            
            self.transform = .identity
            
        }) { (success) in
            //            self.removeFromSuperview()
            self.isHidden = false
            
        }
    }
    
    func animHide(_ duration:CFTimeInterval){
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }) { (success) in
            self.isHidden = true
            
        }
    }
}
