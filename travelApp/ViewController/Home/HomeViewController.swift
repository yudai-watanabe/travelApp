//
//  HomeViewController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import IGListKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    open var selectedPictureCellAction: ((PictureCollectionViewCell) -> Void)?
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let data: [ListDiffable] = [
        Category(categoryTitle: "Popularity"),
        Pictures("Popularity", pictures: [Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                                                  title: "New York City"),
                                          Picture(imageUrl: "https://potovanja.over.net/wp-content/uploads/2017/05/rio.jpg",
                                                  title: "Rio de Janeiro")]),
        Category(categoryTitle: "Recommended"),
        Pictures("Recommende",
                 pictures: [Picture(imageUrl: "https://farm5.staticflickr.com/4301/35992332716_a8b03bda09_b.jpg",
                                    title: "Balcelona"),
                            Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                                    title: "New York City")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

// MARK: - ListAdapterDataSource

extension HomeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is Category: return CategorySectionController()
        case is Pictures:
            let sectionController: HorizontalSectionController = HorizontalSectionController()
            sectionController.delegate = self
            return sectionController
        default: fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

// MARK: - HorizontalSectionControllerDelegate

extension HomeViewController: HorizontalSectionControllerDelegate {
    
    func selected(_ cell: PictureCollectionViewCell?) {
        guard let pictureCell = cell else {
            fatalError("can't found picture cell")
        }
        UIView.animate(withDuration: 0.08, animations: {
            pictureCell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion:{[weak self] bool in
            pictureCell.transform = CGAffineTransform(scaleX: 1, y: 1)
            self?.selectedPictureCellAction?(pictureCell)
        })
    }
}

// MARK: - DestinationViewControllerDelegate

extension HomeViewController: DestinationViewControllerDelegate {
    
    func dissmiss(_ viewController: DestinationViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
