//
//  UIImageView + cornerRadius.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/28.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        
    }
    
    
    
}
