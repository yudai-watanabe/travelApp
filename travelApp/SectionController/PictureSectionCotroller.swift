//
//  ImagesSectionCotroller.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/25.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

final class PictureSectionController: ListSectionController {
    
    var picture: Picture?
    
    override func numberOfItems() -> Int {
        return 1
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
    
}
