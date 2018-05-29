//
//  Picture.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/25.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import IGListKit

class Picture {
    
    let imageUrl: String
    let title: String
    
    init(imageUrl: String, title: String) {
        self.imageUrl = imageUrl
        self.title = title
    }
    
}

extension Picture: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let pictureObj = object as? Picture {
            return self.imageUrl == pictureObj.title || self.title == pictureObj.title
        }
        return false
    }

}
