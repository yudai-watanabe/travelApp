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
import Lottie

class PictureCollectionViewCell: UICollectionViewCell {
    
    var picture: Picture? {
        didSet{
            self.title.text = picture?.title
            if picture?.title == "New York City" {
                self.animationView.setAnimation(named: "like2")
            } else {
                self.animationView.setAnimation(named: "like")
            }
            self.image.af_setImage(withURL: URL(string: picture!.imageUrl)!)
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var animationView: LOTAnimationView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.animationView.addGestureRecognizer(tapGesture)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowOpacity = 2.0
        self.layer.shadowRadius = 5.0
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                             cornerRadius: self.layer.cornerRadius).cgPath
    }
    
    @objc func tap() {
        animationView.play(completion: {[weak self] bool in
            self?.animationView.stop()
        })
    }
}
