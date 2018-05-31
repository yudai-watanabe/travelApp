//
//  HomeCoordinator.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private let title = "Home"
    
    private var homeViewController: HomeViewController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.homeViewController = HomeViewController.instantiateFromStoryBoard() as! HomeViewController
        self.homeViewController.title = title
        self.homeViewController.tabBarItem.image = #imageLiteral(resourceName: "tab_home_active")
        self.homeViewController.selectedPictureCellAction = {cell in
            let destinationViewController = DestinationViewController.instantiateFromStoryBoard() as! DestinationViewController
            destinationViewController.picture = cell.picture
            presenter.pushViewController(destinationViewController, animated: true)
        }
    }
    
    func start() {
        presenter.pushViewController(homeViewController, animated: false)
    }
}
