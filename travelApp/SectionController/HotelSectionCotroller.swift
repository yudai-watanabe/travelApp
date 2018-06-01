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

final class HotelSectionController: ListSectionController {
    
    var hotel: Hotel?
    
    override func sizeForItem(at index: Int) -> CGSize {
        super.sizeForItem(at: index)
        let screenSize = UIScreen.main.bounds.size
        return CGSize(width: screenSize.width, height: 140)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        super.cellForItem(at: index)
        guard let hotel = hotel,
            let cell = collectionContext?.dequeueReusableCell(withNibName: "HotelCollectionViewCell",
                                                              bundle: nil,
                                                              for: self, at: index) as? HotelCollectionViewCell else{
                                                                fatalError("category is nil OR HotelCollectionViewCell has can`t founded")
        }
        cell.hotel = hotel
        return cell
    }
    
}
