//
//  BannerData.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct BannerData {
    var image: UIImage
    
    static let data: [BannerData] = [
        BannerData(image: .banner01),
        BannerData(image: .banner02),
        BannerData(image: .banner03),
    ]
}
