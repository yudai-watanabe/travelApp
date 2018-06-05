//
//  HomeViewController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import IGListKit

protocol HomeViewControllerDelegate: class {
    func homeViewController(_ homeViewController: HomeViewController, didSelect cell: PictureCollectionViewCell)
}

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: HomeViewControllerDelegate?
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    let pictures: Array<Picture> = [Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                                            title: "New York City"),
                                    Picture(imageUrl: "https://potovanja.over.net/wp-content/uploads/2017/05/rio.jpg",
                                            title: "Rio de Janeiro"),
                                    Picture(imageUrl: "https://pmcvariety.files.wordpress.com/2018/05/rexfeatures_4916713ae.jpg",
                                            title: "Tokyo")]
    
    let data: [ListDiffable] = [
        Category(categoryTitle: "Popularity"),
        Pictures("Popularity", pictures: [Picture(imageUrl: "https://media.timeout.com/images/102920649/image.jpg",
                                                  title: "New York City"),
                                          Picture(imageUrl: "https://farm5.staticflickr.com/4301/35992332716_a8b03bda09_b.jpg",
                                                  title: "Balcelona"),
                                          Picture(imageUrl: "https://pmcvariety.files.wordpress.com/2018/05/rexfeatures_4916713ae.jpg",
                                                  title: "Tokyo")]),
        Category(categoryTitle: "Recommended"),
        Pictures("Recommende",
                 pictures: [Picture(imageUrl: "https://potovanja.over.net/wp-content/uploads/2017/05/rio.jpg",
                                    title: "Rio de Janeiro"),
                            Picture(imageUrl: "https://d3atagt0rnqk7k.cloudfront.net/wp-content/uploads/2017/11/14112200/recreational-marijuana-san-fran-1280x800.jpg",
                                    title: "San Francisco"),
                            Picture(imageUrl: "https://malta.intercontinental.com/wp-content/uploads/2016/12/5-reasons-to-turn-on-your-%E2%80%98out-of-office%E2%80%99-and-visit-Malta-1116x580.jpg",
                                    title: "Malta")])]
    
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
    
    func horizontalSectionController(_ sectionController: HorizontalSectionController, selected pictureCell: PictureCollectionViewCell) {
        UIView.animate(withDuration: 0.08, animations: {
            pictureCell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion:{[weak self] bool in
            guard let homeViewController = self else {
                fatalError("homeViewController is nil")
            }
            pictureCell.transform = CGAffineTransform(scaleX: 1, y: 1)
            self?.delegate?.homeViewController(homeViewController, didSelect: pictureCell)
        })
    }
    
}

// MARK: - DestinationViewControllerDelegate

extension HomeViewController: DestinationViewControllerDelegate {
    
    func DestinationViewController(forDissmissed viewController: DestinationViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
