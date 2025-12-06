//
//  TabCell.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/6/25.
//

import SwiftUI

struct TabCell: View {
    
    @Binding var selectedIndex: Int
    
    var index: Int
    var name: String
    var namespace: Namespace.ID
    
    var body: some View {
        Text(name)
            .font(Font.pretendard(.bold_18))
            .foregroundColor(selectedIndex == index ? .baeminBlack : .baeminGray300)
            .frame(height: 40)
            .background(alignment: .bottom) {
                if selectedIndex == index {
                    Rectangle()
                        .fill(Color.baeminBlack)
                        .frame(height: 8)
                        .offset(y: 8)
                        .matchedGeometryEffect(id: "underbar", in: namespace)
                }
            }
            .padding([.horizontal], 7)
    }
}
