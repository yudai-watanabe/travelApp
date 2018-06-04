//
//  hotelSectionCotroller.swift
//  travelApp
//
//  Created by watanabe-yudai on 2018/05/25.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

protocol HotelSectionControllerDelegate: NSObjectProtocol {
    func selected(_ hotel: Hotel, sectionController: HotelSectionController)
}

final class HotelSectionController: ListSectionController {
    
    var hotel: Hotel?
    
    private var cell: HotelCollectionViewCell?
    
    open weak var delegate: HotelSectionControllerDelegate?
    
    override func sizeForItem(at index: Int) -> CGSize {
        super.sizeForItem(at: index)
        let screenSize = UIScreen.main.bounds.size
        return CGSize(width: screenSize.width, height: 140)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        super.cellForItem(at: index)
        self.cell = collectionContext?.dequeueReusableCell(withNibName: "HotelCollectionViewCell",
                                                           bundle: nil,
                                                           for: self, at: index) as? HotelCollectionViewCell
        guard let hotel = hotel,
            let cell = self.cell else{
            fatalError("category is nil OR HotelCollectionViewCell has can`t founded")
        }
        cell.hotel = hotel
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        guard let hotel = self.hotel else{
            fatalError()
        }
        delegate?.selected(hotel, sectionController: self)
    }
}
