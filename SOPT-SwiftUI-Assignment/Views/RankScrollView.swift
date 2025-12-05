//
//  RankScrollView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct RankScrollView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(.baeminBlue500), Color(.white)]),
                        startPoint: .top,
                        endPoint: .bottom))
                .frame(width: .infinity, height: 100)
            VStack {
                HStack {
                    Text("우리 동네 한그릇 인기 랭킹")
                        .font(Font.pretendard(.sb_18))
                    Image(.infoWhite)
                        .resizable()
                        .frame(width: 16, height: 16)
                    Spacer()
                    Text("전체보기")
                        .font(Font.pretendard(.body_r_14))
                    Image(.rightArrowWhite)
                        .resizable()
                        .frame(width: 12, height: 12)
                }
                .foregroundStyle(.white)
                .padding([.horizontal], 16)
                .padding([.top], 64)
                .frame(height: 18)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(RankData.data) { data in
                            RankCell(data: data)
                        }
                    }
                    .padding([.horizontal], 16)
                }
                .padding([.top], 48)
            }
            .background(.clear)
        }
        .background(.white)
    }
}
