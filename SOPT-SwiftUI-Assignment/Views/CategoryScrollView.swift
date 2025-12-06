//
//  CategoryScrollView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryScrollView: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(Array(CategoryData.data.enumerated()), id: \.offset) { index, data in
                    CategorySetCell(data: data)
                        .containerRelativeFrame(.horizontal)
                        .id(index)
                }
            }
            // 5. LazyHStack이 스크롤 타겟임을 명시
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: Binding(
            get: { selectedIndex },
            set: { newValue in
                // 스크롤이 멈춰서 값이 업데이트될 때만 반영
                if let newValue = newValue {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedIndex = newValue
                    }
                }
            }
        ))
        .background(.white)
    }
}

#Preview {
    ContentView()
}
