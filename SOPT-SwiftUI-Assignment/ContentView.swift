//
//  ContentView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    @State var oldYOffset: CGFloat = 0
    @State var isUpScroll: Bool = false
    
    var body: some View {
        TabView {
            VStack {
                VStack {
                    NavigationBar(isUpScroll: $isUpScroll)
                        .padding([.horizontal], 16)
                    SearchBar()
                        .padding([.horizontal], 16)
                        .padding([.top], 4)
                }
                ScrollView {
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
                .onScrollPhaseChange { _, newPhase, context in
                    // 1. 현재 Y 오프셋 값 가져오기
                    let currentYOffset = context.geometry.contentOffset.y
                    // 2. 스크롤 위치 변화 감지
                    // ScrollView의 오프셋은 위로 스크롤(내용이 아래로 이동)하면 양수 = 증가
                    // 아래로 스크롤(내용이 위로 이동)하면 음수 = 감소
                    if currentYOffset > oldYOffset && newPhase != .idle {
                        // .idle 을 방지하는 이유
                        // 이게 없으면, 끝에서 스크롤을 할 때, Spring 효과에 의해 반대 스크롤도 감지된다.
                        // 이 때가 .idle 상태에서 진행되는 것이기 때문에,
                        // idle 상태에서는 변화가 일어나도 값의 변화를 방지해야 한다.
                        self.isUpScroll = true
                    } else if currentYOffset < oldYOffset && newPhase != .idle {
                        self.isUpScroll = false
                    }
                    self.oldYOffset = currentYOffset
                }
                .scrollBounceBehavior(.basedOnSize)
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
