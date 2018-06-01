//
//  Hotel.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/06/01.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import IGListKit

class Hotel {
    
    let name: String
    let imageUrl: String
    let description: String
    let review: Int

    init(name: String, imageUrl: String, description: String, review: Int) {
        self.name = name
        self.imageUrl = imageUrl
        self.description = description
        self.review = review
    }
    
}

extension Hotel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self.name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let hotelObj = object as? Hotel else {
            return false
        }
        return self.name == hotelObj.name
    }
    
}
