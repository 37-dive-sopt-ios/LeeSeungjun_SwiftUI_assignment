//
//  ContentView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            NavigationBar()
                .padding([.horizontal], 16)
            SearchBar()
                .padding([.horizontal], 16)
                .padding([.top], 4)
            EventPromotionView()
                .padding([.top], 24)
            CategoryTabView()
                .padding([.top], -30)
            CategoryScrollView()
                .padding([.top], -7)
            MartketcrollView()
                .padding([.top], 5)
            BannerScrollView()
                .padding([.top], 5)
            RankScrollView()
            Spacer()
        }
        .background(.baeminBackgroundWhite)
    }
}

#Preview {
    ContentView()
}
