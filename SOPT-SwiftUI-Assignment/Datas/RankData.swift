//
//  RankData.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct RankData: Identifiable {
    var id: String
    var menuImage: UIImage
    var menuName: String
    var restaurantName: String
    var discountPercent: Float
    var reviewAverageScore: Float
    var reviewCount: Int
    var originalPrice: Int
    var discountPrice: Int
    
    init(
        menuImage: UIImage,
        menuName: String,
        restaurantName: String,
        discountPercent: Float,
        reviewAverageScore: Float,
        reviewCount: Int,
        originalPrice: Int,
        discountPrice: Int
    ) {
        self.id = menuName
        self.menuImage = menuImage
        self.menuName = menuName
        self.restaurantName = restaurantName
        self.discountPercent = discountPercent
        self.reviewAverageScore = reviewAverageScore
        self.reviewCount = reviewCount
        self.originalPrice = originalPrice
        self.discountPrice = discountPrice
    }
    
    static let data: [RankData] = [
        RankData(menuImage: UIImage(), menuName: "[든든한 한끼]보쌈 막국수", restaurantName: "백억보쌈제육덮밥", discountPercent: 25.0, reviewAverageScore: 5.0, reviewCount: 1973, originalPrice: 16000, discountPrice: 12000),
        RankData(menuImage: UIImage(), menuName: "(1인)피자 + 사이드 set", restaurantName: "파파존스", discountPercent: 25.0, reviewAverageScore: 5.0, reviewCount: 1973, originalPrice: 16000, discountPrice: 12000),
        RankData(menuImage: UIImage(), menuName: "막국수", restaurantName: "족발", discountPercent: 25.0, reviewAverageScore: 5.0, reviewCount: 1973, originalPrice: 16000, discountPrice: 12000),
    ]
}
