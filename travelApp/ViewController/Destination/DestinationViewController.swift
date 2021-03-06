//
//  DestinationViewController.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/30.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage
import GradientView
import Lottie
import IGListKit
import SafariServices

protocol DestinationViewControllerDelegate: NSObjectProtocol {
    func DestinationViewController(forDissmissed viewController: DestinationViewController)
}

class DestinationViewController: UIViewController {
    
    private lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    private let data: [ListDiffable] = [
        Hotel(name: "Hotel 31",
              imageUrl: "https://images.oyster.com/photos/the-hotel--v2043434-w902.jpg",
              description: "This New York City hotel, located seven miles from LaGuardia Airport, offers a 24-hour front desk, express check-out, luggage storage, and a multilingual staff. Hotel 31 is close to a variety of local transportation options.",
              review: 2,
              url: "https://www.hotels.com/ho197409/hoteru-31-nyuyoku-amerika?pos=HCOM_US&locale=en_US"),
        Hotel(name: "W New York Downtown",
              imageUrl: "https://271xf1284tbt2lxdg841m2ea-wpengine.netdna-ssl.com/wp-content/uploads/2015/06/who3154ex.133840_ub.jpg",
              description: "W New York Downtown, with the Hudson River waterfront and sweeping city views, we're just minutes from the Statue of Liberty, 1 World Trade Center, the New York Stock Exchange, Wall Street and Battery Park. Complete with a WIRED Business Center, WHEELS, the Acura Car Experience and Whatever/Whenever at your service, your ultimate urban escape begins here. Pets are welcome.. Hotel has a 1000-square-foot, state-of-the-art, fully-equipped SWEAT Fitness Center.",
              review: 4,
              url: "https://www.hotels.com/ho341910/w-new-york-downtown-new-york-united-states-of-america/?locale=en_US&pos=HCOM_US"),
        Hotel(name: "YOTEL New York",
              imageUrl: "https://t-ec.bstatic.com/images/hotel/max1024x768/992/99266134.jpg",
              description: "YOTEL New York, built in 2011, is an ultra-modern, largely automated hotel, offering a luggage-storing robot should you arrive early or are staying in the city after check-out, a restaurant with communal tables that can be raised and lowered, and an airport-style check-in desk with self-serve monitors. The hotel includes a restaurant, a lounge, and a terrace bar with fire pits. Wireless Internet access is complimentary throughout the hotel. Multiple small meeting rooms, dry cleaning, tour/ticket assistance, and multilingual staff are also available, and the hotel includes a fitness center.",
              review: 4,
              url: "https://www.hotels.com/ho377242/yotel-new-york-new-york-united-states-of-america/?locale=en_US&pos=HCOM_US"),
        Hotel(name: "Hilton Garden Inn New York Times Square South",
              imageUrl: "https://s-ec.bstatic.com/images/hotel/max1024x768/128/128102549.jpg",
              description: "The Hilton Garden Inn New York Times Square South is located less than 1 km away from Jacob K. Javits Convention Centre and 1.3 km from Times Square. Complimentary WiFi is provided.",
              review: 3,
              url:"https://www.hotels.com/ho679739/hilton-garden-inn-new-york-times-square-south-new-york-united-states-of-america/?locale=en_US&pos=HCOM_US" )
    ]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var imageBaseView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var middleGradientView: GradientView!
    
    weak var delegate: DestinationViewControllerDelegate?
    
    open var picture: Picture?
    
    private let screeeSize: CGSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityNameLabel.text = picture?.title
        if let url: URL = URL(string: picture!.imageUrl) {
            self.imageView.af_setImage(withURL: url)
        }
        self.addGradientView()
        self.adapter.collectionView = self.collectionView
        self.adapter.dataSource = self
        self.addFilterButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addGradientView() {
        let rect: CGRect = CGRect(x: 0, y: self.imageView.frame.height/2,
                                  width: screeeSize.width,
                                  height: self.imageView.frame.height/2)
        let gradientView: GradientView = GradientView(frame: rect)
        gradientView.backgroundColor = .clear
        gradientView.colors = [.clear, .white]
        self.imageView.addSubview(gradientView)
    }
    
    private func addFilterButton() {
        let rect: CGRect = CGRect(x: self.screeeSize.width/2 - 60, y: self.screeeSize.height - (76), width: 120, height: 36)
        let filterButtton: UIButton = UIButton(frame: rect)
        filterButtton.backgroundColor = .white
        filterButtton.setTitle("filter", for: .normal)
        filterButtton.setTitleColor(.black, for: .normal)
        filterButtton.cornerRadius = 18
        filterButtton.layer.masksToBounds = false
        filterButtton.layer.shadowColor = UIColor.lightGray.cgColor
        filterButtton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        filterButtton.layer.shadowOpacity = 2.0
        filterButtton.layer.shadowRadius = 5.0
        filterButtton.layer.shadowPath = UIBezierPath(roundedRect: filterButtton.bounds,
                                                      cornerRadius: filterButtton.layer.cornerRadius).cgPath
        self.view.addSubview(filterButtton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func didTapShareButton(_ sender: Any) {
        let images = [imageView.image!]
        let activityViewController = UIActivityViewController(activityItems: images, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
        delegate?.DestinationViewController(forDissmissed: self)
    }
}

extension DestinationViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is Hotel:
            guard let hotel = object as? Hotel else {
                fatalError()
            }
            let hotelSectionController: HotelSectionController = HotelSectionController()
            hotelSectionController.hotel = hotel
            hotelSectionController.delegate = self
            return hotelSectionController
        default: fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension DestinationViewController: HotelSectionControllerDelegate {
    
    func hotelSectionController(_ hotelSectionController: HotelSectionController, selected hotel: Hotel) {
        guard let url = hotel.url else {
            fatalError("can not found a url")
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
}
