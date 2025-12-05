//
//  CategoryScrollView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(CategoryData.data, id:\.name) { data in
                    CategorySetCell(data: data)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
    }
}
