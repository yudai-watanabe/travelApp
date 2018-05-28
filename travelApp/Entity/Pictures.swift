//
//  Pictures.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/28.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import IGListKit

class Pictures {
    
    let category: String
    let pictures: Array<Picture>
    
    init(_ category: String, pictures: Array<Picture>) {
        self.category = category
        self.pictures = pictures
    }
    
}

extension Pictures: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return category as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let picturesObj = object as? Pictures {
            return self.category == picturesObj.category
        }
        return false
    }
    
}
