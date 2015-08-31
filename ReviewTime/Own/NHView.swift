//
//  NHView.swift
//  ReviewTime
//
//  Created by Nathan Hegedus on 25/05/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

class NHView: UIView {

    @IBInspectable var isCircle: Bool = false {
        didSet {
            if isCircle {
                self.layer.cornerRadius = self.frame.size.width/2
            }
        }
    }
   
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColorHexa: String = "" {
        didSet {
            self.layer.borderColor = UIColor(hexa: borderColorHexa, alpha: 1.0).CGColor
        }
    }

}
