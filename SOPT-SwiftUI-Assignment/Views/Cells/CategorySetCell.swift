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
                ForEach(
                    [data.cells[0], data.cells[2], data.cells[4], data.cells[6], data.cells[8]])
                { data in
                    CategoryCell(data: data)
                }
            }
            GridRow {
                ForEach(
                    [data.cells[1], data.cells[3], data.cells[5], data.cells[7], data.cells[9]])
                { data in
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
                    Text("\(data.name)")
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

#Preview {
    ContentView()
}
