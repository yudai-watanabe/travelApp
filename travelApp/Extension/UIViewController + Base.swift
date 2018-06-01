//
//  UIViewController + Base.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public class func instantiateFromStoryBoard<T: UIViewController>() -> T? {
        guard let name: String = self.className else {
            return nil
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        return storyBoard.instantiateInitialViewController() as? T
    }
    
}
