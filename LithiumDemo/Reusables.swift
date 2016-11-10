//
//  Reusables.swift
//  LithiumDemo
//
//  Created by Lab kumar on 08/11/16.
//  Copyright © 2016 Lab kumar. All rights reserved.
//

import Foundation
import UIKit

func prettyDateStringFromString(uglyString: String?, fromFormat: String?, toFormat: String?) -> String {
    guard uglyString != nil else {
        return ""
    }
    //print(uglyString)
    let fromDateFormat = fromFormat ?? "yyyy-MM-dd'T'HH:mm:ss"
    let toDateFormat = toFormat ?? "dd-MMM-yyyy"
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = fromDateFormat
    guard let date = dateFormatter.dateFromString(uglyString!) else {
        return ""
    }
    
    dateFormatter.dateFormat = toDateFormat
    let prettyString = dateFormatter.stringFromDate(date)
    
    return prettyString
}

extension UIView {
    
    func addBottomViewBorder (height: CGFloat, color: UIColor, offset: CGPoint) {
        let existingView = self.viewWithTag(-1001)
        existingView?.removeFromSuperview()
        
        let view = UIView()
        view.tag = -1001
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(\(offset.x))-[view]-(\(offset.y))-|", options: [], metrics: nil, views: ["view" : view]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view(\(height))]|", options: [], metrics: nil, views: ["view" : view]))
    }
    
    func removeBottomBorder () {
        let existingView = self.viewWithTag(-1001)
        existingView?.removeFromSuperview()
    }
}
