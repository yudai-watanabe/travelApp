//
//  PictureCollectionViewCell.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class PictureCollectionViewCell: UICollectionViewCell {

    var picture: Picture? {
        didSet{
            self.title.text = picture?.title
            self.image.af_setImage(withURL: URL(string: (picture?.imageUrl)!)!)
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    
}
