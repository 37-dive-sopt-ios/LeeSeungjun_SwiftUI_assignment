//
//  EventPromotionView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct EventPromotionView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(.baeminBackgroundWhite),
                            Color(.baeminMint100)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            .frame(height: 100)
            HStack {
                VStack(alignment: .leading) {
                    Image(.bmart)
                    HStack {
                        Text("전상품 쿠폰팩 + 60%특가")
                            .font(Font.pretendard(.bold_16))
                        Image(.rightArrow)
                    }
                }
                Spacer()
            }
            .padding([.top], -20)
            .padding([.horizontal], 16)
        }
    }
}
