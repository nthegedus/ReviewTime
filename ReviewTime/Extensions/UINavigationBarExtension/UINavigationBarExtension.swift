//
//  UINavigationBar.swift
//
//  Created by Nathan Hegedus on 12/3/14.
//  Copyright (c) 2014 Nathan Hegedus. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func titleWithCustomFont(fontName: String, size: CGFloat, andColor color: UIColor) {
        
        self.titleTextAttributes = [NSFontAttributeName: UIFont(name: fontName, size: size)!,
                                    NSForegroundColorAttributeName: color]
        
    }
    
}

