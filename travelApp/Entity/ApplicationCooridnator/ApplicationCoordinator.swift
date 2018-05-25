//
//  ApplicationCoordinator.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UITabBarController = UITabBarController()
    
    let homeNavigationController = UINavigationController()
    let tripNavigationController = UINavigationController()
    let myPageNavigationController = UINavigationController()
   
    let homeCoordinator: HomeCoordinator
    let tripCoordinator: TripCoordinator
    let myPageCoordinator: MyPageCoordinator
    
    init(window: UIWindow) {
        self.window = window
        let viewControllers: Array<UINavigationController> = [homeNavigationController,
                                                              tripNavigationController,
                                                              myPageNavigationController]
        self.rootViewController.setViewControllers(viewControllers, animated: false)
        self.homeCoordinator = HomeCoordinator(presenter: homeNavigationController)
        self.tripCoordinator = TripCoordinator(presenter: tripNavigationController)
        self.myPageCoordinator = MyPageCoordinator(presenter: myPageNavigationController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        homeCoordinator.start()
        tripCoordinator.start()
        myPageCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}
