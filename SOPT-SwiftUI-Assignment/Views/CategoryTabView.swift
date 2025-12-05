//
//  CategoryTabView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct CategoryTabView: View {
    
    @State var selectedIndex: Int = 0
    // 1. 애니메이션 네임스페이스 선언
    @Namespace private var animationNamespace
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(CategoryData.data.enumerated(), id: \.offset) { index, data in
                    Button {
                        // 2. 상태 변경 시 애니메이션 효과 부여
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedIndex = index
                        }
                    } label: {
                        TabCell(
                            selectedIndex: $selectedIndex,
                            index: index,
                            name: data.name,
                            namespace: animationNamespace // 3. Namespace 전달
                        )
                    }
                }
            }
            .padding([.horizontal], 16)
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
    
    // 4. 부모로부터 Namespace를 전달받을 변수 추가
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
                        .frame(height: 11)
                        .offset(y: 8)
                        // 6. 핵심: 같은 id("underbar")를 가진 뷰끼리 위치를 매칭하여 이동 애니메이션 생성
                        .matchedGeometryEffect(id: "underbar", in: namespace)
                }
            }
            .padding([.horizontal], 7)
    }
}

#Preview {
    ContentView()
}
