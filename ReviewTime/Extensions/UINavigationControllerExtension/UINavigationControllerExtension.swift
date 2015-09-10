//
//  UINavigationControllerExtension.swift
//
//  Created by Nathan Hegedus on 12/3/14.
//  Copyright (c) 2014 Nathan Hegedus. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    
    func pushViewControllerWithFade(viewController viewController: UIViewController) {
    
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        
        self.view.layer.addAnimation(transition, forKey: nil)
        
        if self.navigationController?.viewControllers.last != viewController {

            self.pushViewController(viewController, animated: false)

        }
        
    }
    
    func popViewControllerAnimatedWithFade() {
        
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        
        self.view.layer.addAnimation(transition, forKey: nil)
        self.popViewControllerAnimated(false)
        
    }
    
    func popToRootViewControllerAnimatedWithFade() {
        
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        
        self.view.layer.addAnimation(transition, forKey: nil)
        self.popToRootViewControllerAnimated(false)
        
    }
    
    func popToViewControllerWithFade(viewController viewController: UIViewController) {
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        
        self.view.layer.addAnimation(transition, forKey: nil)
        self.popToViewController(viewController, animated: false)
        
    }
    
    func removeFirstViewController() {
        var viewControllers = self.viewControllers
        viewControllers.removeAtIndex(0)
        self.viewControllers = viewControllers
    }
    
}

