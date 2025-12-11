//
//  CategoryTabView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryTabView: View {
    
    @Binding var selectedIndex: Int
    @Namespace private var animationNamespace
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(CategoryData.data.enumerated(), id: \.offset) { index, data in
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedIndex = index
                            }
                        } label: {
                            TabCell(
                                selectedIndex: $selectedIndex,
                                index: index,
                                name: data.name,
                                namespace: animationNamespace)
                        }
                    }
                }
                .padding([.horizontal], 16)
            }
            .onChange(of: selectedIndex) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    proxy.scrollTo(selectedIndex, anchor: .center)
                }
            }
            .frame(height: 48)
            .background(.white)
            .cornerRadius(10, corners: [.topLeft, .topRight])
            .shadow(color: .baeminMint300, radius: 4, x: 0, y: -6)
        }
    }
}

#Preview {
    ContentView()
}
