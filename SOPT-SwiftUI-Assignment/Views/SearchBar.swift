//
//  SearchBar.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            TextField("찾아라! 맛있는 음식과 맛집", text: .constant(""))
                .padding([.horizontal], 20)
                .padding([.vertical], 10)
                .font(Font.pretendard(.body_r_14))
                .foregroundColor(.black)
            
            Image(.search)
                .padding([.trailing], 17)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1))
        .frame(height: 40)
    }
}
