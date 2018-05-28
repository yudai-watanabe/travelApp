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
        Pictures("Popularity",
                 pictures: [Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                                    title: "New York City"),
                            Picture(imageUrl: "https://potovanja.over.net/wp-content/uploads/2017/05/rio.jpg",
                                    title: "Rio de Janeiro")]),
        Category(categoryTitle: "Recommended"),
        Pictures("Recommended",
                 pictures: [Picture(imageUrl: "https://farm5.staticflickr.com/4301/35992332716_a8b03bda09_b.jpg",
                                    title: "Balcelona")])
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
        switch object {
        case is Category:
            let sectionController = CategorySectionController()
            sectionController.category = object as? Category
            return sectionController
        case is Array<Picture>: return HorizontalSectionController()
        default: fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
