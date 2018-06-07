//
//  UICollectionViewCell + Bounce.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/06/07.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    func bounce(completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.08, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion:{bool in
            if bool {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                completion?()
            }
        })
    }
    
}
