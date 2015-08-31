//
//  UIColorExtension.swift
//  RSBarcodesSample
//
//  Created by R0CKSTAR on 6/13/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexa: String, alpha: CGFloat) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = alpha
        var hex = hexa
        
        if hexa.hasPrefix("#") {
            let index = advance(hexa.startIndex, 1)
            hex = hexa.substringFromIndex(index)
        }
        
        let scanner = NSScanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        
        if scanner.scanHexLongLong(&hexValue) {
            if count(hex) == 6 {
                red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
                blue  = CGFloat(hexValue & 0x0000FF) / 255.0
            } else if count(hex) == 8 {
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            } else {
                print("invalid rgb string, length should be 7 or 9")
            }
        } else {
            print("scan hex error")
        }

        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

}