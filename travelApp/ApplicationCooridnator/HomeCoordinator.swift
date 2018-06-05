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
        self.homeViewController.delegate = self
    }
    
    func start() {
        presenter.pushViewController(homeViewController, animated: false)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    
    func homeViewController(_ homeViewController: HomeViewController, didSelect cell: PictureCollectionViewCell) {
        let destinationViewController = DestinationViewController.instantiateFromStoryBoard() as! DestinationViewController
        destinationViewController.modalTransitionStyle = .crossDissolve
        destinationViewController.picture = cell.picture
        destinationViewController.delegate = self.homeViewController
        presenter.present(destinationViewController, animated: true, completion: nil)
    }
    
}
