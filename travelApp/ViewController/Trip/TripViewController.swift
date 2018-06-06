//
//  TripViewController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import IGListKit

class TripViewController: UIViewController {
    
    let data: Array<ListDiffable> = [
        Picture(imageUrl: "https://d3atagt0rnqk7k.cloudfront.net/wp-content/uploads/2017/11/14112200/recreational-marijuana-san-fran-1280x800.jpg",
                title: "San Francisco"),
        Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                 title: "New York City"),
        Picture(imageUrl: "https://farm5.staticflickr.com/4301/35992332716_a8b03bda09_b.jpg",
                 title: "Balcelona"),
        Picture(imageUrl: "https://pmcvariety.files.wordpress.com/2018/05/rexfeatures_4916713ae.jpg",
                 title: "Tokyo")
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var adapter: ListAdapter = {
       return ListAdapter(updater: ListAdapterUpdater(),
                          viewController: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = self.collectionView
        adapter.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
}

extension TripViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is Picture: return PictureSectionController()
        default: fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
