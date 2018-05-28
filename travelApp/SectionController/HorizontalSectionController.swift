//
//  HorizontalSectionController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/28.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import IGListKit
import UIKit

final class HorizontalSectionController: ListSectionController {
    
    private var pictures: Array<Picture>?
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width,
                      height: 326)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "EmbeddedCollectionViewCell",
                                                                bundle: nil,
                                                                for: self, at: index) as? EmbeddedCollectionViewCell else{
                                                                    fatalError("category is nil OR PictureCollectionViewCell has can`t founded")
        }
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    override func didUpdate(to object: Any) {
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
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
