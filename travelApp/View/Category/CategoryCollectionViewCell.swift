//
//  CategoryCollectionViewCell.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    var cartegory: Category? {
        didSet{
            self.categoryTitle.text = cartegory?.tiltle
        }
    }
    
    @IBOutlet weak var categoryTitle: UILabel!

}
