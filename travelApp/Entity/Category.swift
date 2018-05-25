//
//  Category.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/25.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import IGListKit

class Category {
    
    let tiltle: String
    
    init(categoryTitle: String) {
        self.tiltle = categoryTitle
    }
}

extension Category: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return tiltle as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let categoryObj = object as? Category {
            return tiltle == categoryObj.tiltle
        }
        return false
    }
}

