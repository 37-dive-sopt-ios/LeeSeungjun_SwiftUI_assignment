//
//  CategorySetCell.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategorySetCell: View {
    
    var data: CategoryData
    
    var body: some View {
        VStack {
            Grid(
                alignment: .center,
                horizontalSpacing: 12,
                verticalSpacing: 12,
            ) {
                GridRow {
                    ForEach([
                        CategoryCellData(image: .oneBowl, name: "한그릇"),
                        CategoryCellData(image: .chicken, name: "치킨"),
                        CategoryCellData(image: .cafeDesert, name: "카페·디저트"),
                        CategoryCellData(image: .pizza, name: "피자"),
                        CategoryCellData(image: .snackFood, name: "분식")]) { data in
                            CategoryCell(data: data)
                        }
                }
                GridRow {
                    ForEach([
                        CategoryCellData(image: .meat, name: "고기"),
                        CategoryCellData(image: .soup, name: "찜·탕"),
                        CategoryCellData(image: .lateFood, name: "야식"),
                        CategoryCellData(image: .fastfood, name: "패스트푸드"),
                        CategoryCellData(image: .pickUp, name: "픽업")]) { data in
                            CategoryCell(data: data)
                        }
                }
            }
            .padding([.vertical], 10)
            .padding([.horizontal], 16)
            Divider()
            Button {
                
            } label: {
                HStack(spacing: 0) {
                    Text("음식배달")
                        .font(Font.pretendard(.body_b_14))
                    Text("에서 더보기")
                        .font(Font.pretendard(.body_m_14))
                    Image(.rightArrow)
                        .frame(width: 20)
                }
                .frame(height: 26)
                .tint(.black)
            }
            Rectangle()
                .foregroundStyle(.white)
                .frame(height: 2)
        }
        .background(.white)
    }
}
