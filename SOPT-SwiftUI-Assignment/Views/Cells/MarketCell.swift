//
//  MarketCell.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct MarketCell: View {
    
    var data: MarketData
    
    var body: some View {
        VStack {
            Image(uiImage: data.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 58, height: 58)
            Text(data.name)
                .font(Font.pretendard(.body_r_14))
                .foregroundStyle(.black)
        }
        .frame(width: 62, height: 78)
    }
}
