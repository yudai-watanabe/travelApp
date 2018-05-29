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
            self.image.af_setImage(withURL: URL(string: (picture?.imageUrl)!)!)
            self.animationView.setAnimation(named: "like")
            self.heartButton.addTarget(self, action:  #selector(tappedHeartButton(_:)), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var animationView: LOTAnimationView!
    
    @objc func tappedHeartButton(_ sender: UIButton) {
        let animation = LOTAnimationView(name: "like")
        animation.frame = CGRect(x: 0, y: 0, width: 23, height: 22)
        self.heartButton.addSubview(animation)
        animation.play()
    }
}
