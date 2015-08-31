//
//  NHImageView.swift
//  Registradores-Arisp
//
//  Created by Nathan Hegedus on 30/06/15.
//  Copyright (c) 2015 Nathan Hegedus. All rights reserved.
//

import UIKit

class NHImageView: UIImageView {

    @IBInspectable var streachSize: Int = 0 {
        didSet {
            let backgroundImage = self.image?.stretchableImageWithLeftCapWidth(streachSize, topCapHeight: streachSize)
            self.image = backgroundImage
        }
    }

}
