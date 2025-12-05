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
            MartketcrollView()
                .padding([.top], 10)
            BannerScrollView()
                .padding([.top], 10)
            Spacer()
        }
        .background(.baeminBackgroundWhite)
    }
}

#Preview {
    ContentView()
}
