//
//  DestinationViewController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/30.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import GradientView
import Lottie

class DestinationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var imageBaseView: UIView!
    
    var picture: Picture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameLabel.text = picture?.title
        self.imageView.af_setImage(withURL: URL(string: picture!.imageUrl)!)
        self.addGradientView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func addGradientView() {
        let rect: CGRect = CGRect(x: 0, y: imageBaseView.frame.height / 2,
                                  width: imageBaseView.frame.width,
                                  height: imageBaseView.frame.height/2)
        let gradientView: GradientView = GradientView(frame: rect)
        gradientView.backgroundColor = .clear
        gradientView.colors = [.clear, .white]
        gradientView.direction = .vertical
        self.imageView.addSubview(gradientView)
    }
}
