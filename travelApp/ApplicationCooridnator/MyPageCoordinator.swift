//
//  MyPageCoordinator.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class MyPageCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private var myPageViewController: MyPageViewController
    
    private let title: String = "MyPage"
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.myPageViewController = MyPageViewController.instantiateFromStoryBoard() as! MyPageViewController
        self.myPageViewController.title = title
        self.myPageViewController.tabBarItem.image = #imageLiteral(resourceName: "tab_mypage")
    }
    
    func start() {
        presenter.pushViewController(myPageViewController, animated: false)
    }
    
}
