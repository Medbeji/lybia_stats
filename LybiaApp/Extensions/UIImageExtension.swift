//
//  UIImageExtension.swift
//  LybiaApp
//
//  Created by MedBeji on 12/01/2018.
//  Copyright © 2018 unfpa. All rights reserved.
//

import UIKit

extension UIImageView{
    var imageWithFade:UIImage?{
        get{
            return self.image
        }
        set{
            UIView.transition(with: self,
                              duration: 0.5, options: .transitionCrossDissolve, animations: {
                                self.image = newValue
            }, completion: nil)
        }
    }
}
