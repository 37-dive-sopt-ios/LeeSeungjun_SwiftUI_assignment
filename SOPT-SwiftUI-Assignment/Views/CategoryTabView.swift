//
//  CategoryTabView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryTabView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(CategoryData.data.enumerated(), id: \.offset) { index, data in
                    Button {
                        
                    } label: {
                        Text("\(data.name)")
                            .font(Font.pretendard(.bold_18))
                            .tint(.gray)
                            .padding([.horizontal], 7)
                    }
                }
            }
            .padding([.horizontal], 10)
        }
        .frame(height: 48)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .baeminMint300, radius: 4, x: 0, y: -6)
    }
}
