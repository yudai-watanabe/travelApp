//
//  PictureSectionController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/06/06.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import IGListKit

final class PictureSectionController: ListSectionController {
    
    private var picture: Pictures?
    
    private var cells: [Int: PictureCollectionViewCell] = [:]
    
    private let screeeSize: CGSize = UIScreen.main.bounds.size
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 3
        self.minimumLineSpacing = 3
    }
    
    override func numberOfItems() -> Int {
        return picture?.pictures.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = floor((width / 2) - 6 )
        return CGSize(width: itemSize, height: itemSize)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let picture = picture,
            let cell = collectionContext?.dequeueReusableCell(withNibName: "PictureCollectionViewCell",
                                                              bundle: nil,
                                                              for: self, at: index) as? PictureCollectionViewCell else{
            fatalError("category is nil OR PictureCollectionViewCell has can`t founded")
        }
        cell.picture = picture.pictures[index]
        cells.updateValue(cell, forKey: index)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.picture = object as? Pictures
    }
    
    override func didSelectItem(at index: Int) {
        cells[index]?.bounce(completion: nil)
    }
}
