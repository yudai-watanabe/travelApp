//
//  EmbeddedSectionController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/28.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import IGListKit

final class EmbeddedSectionController: ListSectionController {
    
    private var picture: Picture?
    
    override init() {
         super.init()
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 226, height: 326)   
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let picture = picture,
            let cell = collectionContext?.dequeueReusableCell(withNibName: "PictureCollectionViewCell",
                                                              bundle: nil,
                                                              for: self, at: index) as? PictureCollectionViewCell else{
                                                                fatalError("category is nil OR PictureCollectionViewCell has can`t founded")
        }
        cell.picture = picture
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.picture = object as? Picture
    }
    
}
