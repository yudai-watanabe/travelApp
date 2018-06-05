//
//  HotelCollectionViewCell.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/06/01.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Lottie
import Cosmos

class HotelCollectionViewCell: UICollectionViewCell {

    open var hotel: Hotel? {
        didSet{
            self.name.text = hotel?.name
            self.descriptionlabel.text = hotel?.description
            self.image.af_setImage(withURL: URL(string: hotel!.imageUrl)!)
            self.ratingView.rating = Double(exactly: (hotel?.review)!)!
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var descriptionlabel: UILabel!
    
}
