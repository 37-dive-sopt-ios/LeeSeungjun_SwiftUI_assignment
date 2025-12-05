//
//  NavigationBar.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Button {
                print("Location Tapped")
            } label: {
                Text("우리집")
                    .font(Font.pretendard(.bold_16))
            }
            .tint(Color(.black))
            Image(uiImage: .plygon)
            
            
            Spacer()
            Button {
                print("divider Tapped")
            } label: {
                Image(uiImage: .divider)
            }
            Button {
                print("divider Tapped")
            } label: {
                Image(uiImage: .notification)
            }
            Button {
                print("divider Tapped")
            } label: {
                Image(uiImage: .cart)
            }
        }
        .frame(height: 24)
    }
}
