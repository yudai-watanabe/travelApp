//
//  HorizontalSectionController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/28.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import IGListKit
import UIKit

protocol HorizontalSectionControllerDelegate: NSObjectProtocol {
    func selected(_ cell: PictureCollectionViewCell?)
}

final class HorizontalSectionController: ListSectionController {
    
    private var pictures: Array<Picture>?
    
    weak var delegate: HorizontalSectionControllerDelegate?
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func numberOfItems() -> Int {
        super.numberOfItems()
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        super.sizeForItem(at: index)
        return CGSize(width: collectionContext!.containerSize.width,
                      height: 326)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        super.cellForItem(at: index)
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
        super.didUpdate(to: object)
        if let pictures = object as? Pictures {
            self.pictures = pictures.pictures
        }
    }
    
}

extension HorizontalSectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let pictures = self.pictures else { return [] }
        return pictures.map { $0 as ListDiffable }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController: EmbeddedSectionController = EmbeddedSectionController()
        sectionController.delegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension HorizontalSectionController: EmbeddedSectionControllerDelegate {
    
    func selected(_ cell: PictureCollectionViewCell?) {
        delegate?.selected(cell)
    }
    
}
