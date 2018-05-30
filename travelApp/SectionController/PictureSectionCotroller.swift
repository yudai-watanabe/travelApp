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
    
    override func sizeForItem(at index: Int) -> CGSize {
        super.sizeForItem(at: index)
        return CGSize(width: 226, height: 326)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        super.cellForItem(at: index)
        guard let picture = picture,
            let cell = collectionContext?.dequeueReusableCell(withNibName: "PictureCollectionViewCell",
                                                              bundle: nil,
                                                              for: self, at: index) as? PictureCollectionViewCell else{
                                                                fatalError("category is nil OR PictureCollectionViewCell has can`t founded")
        }
        cell.picture = picture
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        cell.layer.shadowOpacity = 2.0
        cell.layer.shadowRadius = 10.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,
                                             cornerRadius: cell.layer.cornerRadius).cgPath
        return cell
    }
    
}
