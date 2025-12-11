//
//  RankCell.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct RankCell : View {
    
    var data: RankData
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: data.menuImage)
                .resizable()
                .frame(width: 145, height: 145)
                .background(.baeminGray200)
                .cornerRadius(8)
            HStack(spacing: 3) {
                Text(data.menuName)
                Spacer()
                Image(uiImage: .reviewStar)
                    .resizable()
                    .frame(width: 11, height: 11)
                Text(String(format: "(%.1f)",data.reviewAverageScore))
                Text("(\(data.reviewCount))")
            }
            .lineLimit(1)
            .font(.pretendard(.caption_r_12))
            .foregroundColor(.baeminGray600)
            Text(data.menuName)
                .font(Font.pretendard(.body_r_14))
                .lineLimit(1)
            HStack {
                Text(String(format: "%.0f%%", data.discountPercent))
                    .foregroundStyle(.baeminRed)
                Text("\(data.discountPrice)원")
            }
            .font(.pretendard(.body_b_14))
            Text("\(data.originalPrice)원")
                .foregroundStyle(.baeminGray600)
                .font(.pretendard(.caption_r_12))
            Text("최소주문금액 없음")
                .foregroundStyle(.baeminBlue700)
                .font(.pretendard(.body_b_14))
        }
        .frame(width: 145)
        .padding([.bottom], 20)
    }
}
