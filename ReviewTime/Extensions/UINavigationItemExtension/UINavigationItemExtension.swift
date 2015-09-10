//
//  UINavigationItem.swift
//
//  Created by Nathan Hegedus on 12/3/14.
//  Copyright (c) 2014 Nathan Hegedus. All rights reserved.
//

import UIKit

enum Side {
    
    case Right;
    case Left;
    
}

extension UINavigationItem {
    
    func removeLeftButton() {
        self.setSide(Side.Left, buttonItem: nil)
    }
    
    func removeRightButton() {
        self.setSide(Side.Right, buttonItem: nil)
    }
    
    func customButtonNavigationbar(side: Side, title: String, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        
        let buttonItem : UIBarButtonItem = UIBarButtonItem(title: title, style: style, target: target, action: action)

        self.setSide(side, buttonItem: buttonItem)
        
        return buttonItem
    }
    
    func customButtonNavigationbar(side: Side, image: UIImage, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector) -> UIBarButtonItem{
        
        let buttonItem : UIBarButtonItem = UIBarButtonItem(image: image, style: style, target: target, action: action)
        
        self.setSide(side, buttonItem: buttonItem)
        
        return buttonItem
    }
    
    func customButtonNavigationbar(side: Side, button: UIButton) {
        
        let buttonItem : UIBarButtonItem = UIBarButtonItem(customView: button)
        self.setSide(side, buttonItem: buttonItem)
        
    }
    
    private func setSide(side: Side, buttonItem: UIBarButtonItem?) {
        
        if side == .Right {
            self.rightBarButtonItem = buttonItem
        }else{
            self.leftBarButtonItem = buttonItem
        }
        
    }
    
}

