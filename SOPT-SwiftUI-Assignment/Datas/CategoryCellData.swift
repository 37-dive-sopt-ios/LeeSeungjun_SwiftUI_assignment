//
//  CategoryCellData.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryCellData: Identifiable {
    var id: String
    var image = UIImage()
    var name: String
    
    init(image: UIImage, name: String) {
        self.id = name
        self.name = name
        self.image = image
    }
}
