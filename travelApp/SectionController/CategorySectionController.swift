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
    
    private var category: Category?
    
    override func sizeForItem(at index: Int) -> CGSize {
        super.sizeForItem(at: index)
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
    
    override func didUpdate(to object: Any) {
        super.didUpdate(to: object)
        self.category = object as? Category
    }
    
}
