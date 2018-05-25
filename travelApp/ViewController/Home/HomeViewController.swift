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
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let data: Array<ListDiffable> = [
        Category(categoryTitle: "Popularity"),
        Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                title: "New York City"),
        Category(categoryTitle: "Recommended"),
        Picture(imageUrl: "https://farm5.staticflickr.com/4301/35992332716_a8b03bda09_b.jpg",
                title: "Balcelona")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = collectionView
        adapter.dataSource = self
        // Do any additional setup after loading the view.
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
        if let category = object as? Category {
            let sectionController = CategorySectionController()
            sectionController.category = category
            return sectionController
        } else if let picture = object as? Picture  {
            let sectionController = PictureSectionController()
            sectionController.picture = picture
            return sectionController
        } else {
            fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
