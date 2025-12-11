//
//  NavigationBar.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var isUpScroll: Bool
    @State var barHeight: CGFloat = 24 // 초기 높이 (나타난 상태)
    @State private var opacity: Double = 1.0
    
    private let originalHeight: CGFloat = 24
    
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
        .frame(height: barHeight)
        .opacity(opacity)
        .clipped() // 애니메이션 효과 적용
        .onChange(of: isUpScroll) { _, newValue in
            withAnimation(.easeInOut(duration: 0.1)) {
                barHeight = newValue ? 0 : originalHeight
                opacity = newValue ? 0.0 : 1.0
            }
        }
        
    }
}
