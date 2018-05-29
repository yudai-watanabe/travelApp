//
//  CategorySectionController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/25.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

final class CategorySectionController: ListSectionController {
    
    var category: Category?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 64)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let category = category,
            let cell = collectionContext?.dequeueReusableCell(withNibName: "CategoryCollectionViewCell",
                                                              bundle: nil,
                                                              for: self, at: index) as? CategoryCollectionViewCell else{
            fatalError("category is nil OR CategoryCollectionViewCell has can`t founded")
        }
        cell.cartegory = category
        
        return cell
    }
    
}
