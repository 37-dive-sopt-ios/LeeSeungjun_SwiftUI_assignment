//
//  ContentView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        TabView {
            ScrollView {
                NavigationBar()
                    .padding([.horizontal], 16)
                SearchBar()
                    .padding([.horizontal], 16)
                    .padding([.top], 4)
                EventPromotionView()
                    .padding([.top], 24)
                CategoryTabView(selectedIndex: $selectedIndex)
                    .padding([.top], -30)
                CategoryScrollView(selectedIndex: $selectedIndex)
                    .padding([.top], -7)
                MartketcrollView()
                    .padding([.top], 5)
                BannerScrollView()
                    .padding([.top], 5)
                RankScrollView()
                Spacer()
            }
            .background(.baeminBackgroundWhite)
            .tabItem {
                Image(.homeSelected)
                Text("홈")
                Color(.black)
            }
            
            VStack {
                Text("장보기·쇼핑")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow)
            .tabItem {
                Image(.shop)
                Text("장보기·쇼핑")
                Color(.black)
            }
            
            VStack {
                Text("찜")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.orange)
            .tabItem {
                Image(.heart)
                Text("찜")
                Color(.black)
            }
            
            VStack {
                Text("주문내역")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
            .tabItem {
                Image(.list)
                Text("주문내역")
                Color(.black)
            }
            
            VStack {
                Text("마이배민")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.baeminBlue500)
            .tabItem {
                Image(.myPage)
                Text("마이배민")
                Color(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}
