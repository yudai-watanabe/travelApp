//
//  EmbeddedSectionController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/28.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import IGListKit

protocol EmbeddedSectionControllerDelegate : NSObjectProtocol{
    
    func embeddedSectionController(_ sectionController: EmbeddedSectionController, selected cell: PictureCollectionViewCell)
    
}

final class EmbeddedSectionController: ListSectionController {
    
    private var picture: Picture?
    
    private var cell: PictureCollectionViewCell?
    
    weak var delegate: EmbeddedSectionControllerDelegate?
    
    override init() {
         super.init()
        self.inset = UIEdgeInsets(top: 18, left: 16, bottom: 48, right: 8)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        super.sizeForItem(at: index)
        return CGSize(width: 210, height: 290)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        super.cellForItem(at: index)
        guard let picture = picture else{
            fatalError("category is nil OR PictureCollectionViewCell has can`t founded")
        }
        cell = collectionContext?.dequeueReusableCell(withNibName: "PictureCollectionViewCell",
                                                      bundle: nil,
                                                      for: self, at: index) as? PictureCollectionViewCell
        cell?.picture = picture
        return cell!
    }
    
    override func didUpdate(to object: Any) {
        super.didUpdate(to: object)
        self.picture = object as? Picture
    }
    
    
    
    override func didSelectItem(at index: Int) {
        guard let cell = self.cell else {
            fatalError("PictureCollectionViewCell is nil")
        }
        delegate?.embeddedSectionController(self, selected: cell)
    }
    
}
