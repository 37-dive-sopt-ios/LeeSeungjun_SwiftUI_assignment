//
//  CategoryTabView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryTabView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(CategoryData.data.enumerated(), id: \.offset) { index, data in
                    Button {
                        selectedIndex = index
                    } label: {
                        TabCell(
                            selectedIndex: $selectedIndex,
                            index: index,
                            name: data.name)
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

struct TabCell: View {
    
    @Binding var selectedIndex: Int
    var index: Int
    var name: String
    
    var body: some View {
        Text(name)
            .font(Font.pretendard(.bold_18))
            .tint(selectedIndex == index ? .baeminBlack : .baeminGray300)
            .padding([.horizontal], 7)
    }
}

#Preview {
    ContentView()
}
