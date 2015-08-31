//
//  UIImageExtension.swift
//  Beat Fantasma
//
//  Created by Nathan Hegedus on 12/3/14.
//  Copyright (c) 2014 Nathan Hegedus. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageWithColor(#color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}

