//
//  TripCoordinator.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit

class TripCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    private var tripViewController: TripViewController
    
    private let title: String = "Plan"
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.tripViewController = TripViewController.instantiateFromStoryBoard() as! TripViewController
        self.tripViewController.title = title
        self.tripViewController.tabBarItem.image = #imageLiteral(resourceName: "tab_plan")
        self.tripViewController.delegate = self
    }
    
    func start() {
        presenter.pushViewController(tripViewController, animated: false)
    }
}

extension TripCoordinator: TripViewControllerDelegate {
    
    func tripViewControllerDelegate(_ viewController: TripViewController, selected cell: PictureCollectionViewCell) {
        guard let  picture = cell.picture else{
            fatalError()
        }
        let destinationViewController = DestinationViewController.instantiateFromStoryBoard() as! DestinationViewController
        destinationViewController.picture = picture
        destinationViewController.delegate = self.tripViewController
        self.presenter.pushViewController(destinationViewController, animated: true)
    }

}
