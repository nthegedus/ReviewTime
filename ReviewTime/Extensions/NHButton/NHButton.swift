//
//  NHImageView.swift
//  Registradores-Arisp
//
//  Created by Nathan Hegedus on 24/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

class NHButton: UIButton {

    @IBInspectable var streachSize: Int = 0 {
        didSet {
            let backgroundImage = self.currentBackgroundImage?.stretchableImageWithLeftCapWidth(streachSize, topCapHeight: streachSize)
            self.setBackgroundImage(backgroundImage, forState: .Normal)
            self.setBackgroundImage(backgroundImage, forState: .Highlighted)
            self.setBackgroundImage(backgroundImage, forState: .Disabled)
            self.setBackgroundImage(backgroundImage, forState: .Selected)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var layerBackgroundColor: UIColor = UIColor.clearColor() {
        didSet {
            self.layer.backgroundColor = layerBackgroundColor.CGColor
        }
    }
   
}
