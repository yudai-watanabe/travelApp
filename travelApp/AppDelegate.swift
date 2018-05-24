//
//  AppDelegate.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/23.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var applicationCoordinator: ApplicationCoordinator = {
        return ApplicationCoordinator(window: self.window!)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
       self.window = UIWindow(frame: UIScreen.main.bounds)
        self.applicationCoordinator.start()
        
        return true
    }

}

