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
    
    private var picture: Picture?
    
    private let screeeSize: CGSize = UIScreen.main.bounds.size
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: (screeeSize.width / 2) - 32, height: (screeeSize.height / 3) - 16)
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
    
    override func didSelectItem(at index: Int) {
        
    }
}
