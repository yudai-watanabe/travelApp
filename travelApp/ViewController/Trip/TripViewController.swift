//
//  TripViewController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/24.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import Lottie

class TripViewController: UIViewController {

    @IBOutlet weak var animationView: LOTAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animationView.setAnimation(named: "airplane")
        animationView.animationSpeed = 0.8
        animationView.loopAnimation = true
        animationView.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
