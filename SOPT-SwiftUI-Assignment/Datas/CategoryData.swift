//
//  CategoryData.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryData: Identifiable {
    var id: String
    var name: String
    var cells: [CategoryCellData]
    
    init(name: String, cells: [CategoryCellData]) {
        self.id = name
        self.name = name
        self.cells = cells
    }
    
    static let data = [
        CategoryData( name: "음식배달", cells: [
            CategoryCellData(image: .oneBowl, name: "한그릇"), CategoryCellData(image: .chicken, name: "치킨"),
            CategoryCellData(image: .cafeDesert, name: "카페·디저트"), CategoryCellData(image: .pizza, name: "피자"),
            CategoryCellData(image: .snackFood, name: "분식"), CategoryCellData(image: .meat, name: "고기"),
            CategoryCellData(image: .soup, name: "찜·탕"), CategoryCellData(image: .lateFood, name: "야식"),
            CategoryCellData(image: .fastfood, name: "패스트푸드"), CategoryCellData(image: .pickUp, name: "픽업"),]),
        CategoryData(name: "픽업", cells: []),
        CategoryData(name: "장보기·쇼핑", cells: []),
        CategoryData(name: "선물하기", cells: []),
        CategoryData(name: "헤택모아보기", cells: []),
        CategoryData(name: "배민푸드스타", cells: []),
    ]
}
