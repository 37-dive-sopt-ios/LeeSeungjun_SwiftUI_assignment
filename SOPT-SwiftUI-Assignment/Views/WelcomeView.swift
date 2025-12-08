//
//  WelcomeView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/6/25.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.dismiss) private var dismiss
    
    var username: String
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(.leftPointer)
                        .resizable()
                        .frame(width: 15, height: 16)
                }
                Spacer()
                Text("대체 뼈짐 누가 시켰어??")
                    .font(.pretendard(.sb_18))
                Spacer()
            }
            .padding([.bottom], 25)
            .padding([.horizontal], 16)
            
            Image(.welcome)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 211)
            
            Text("환영합니다.")
                .font(.pretendard(.title_b_24))
                .padding([.top], 24)
            
            Text("\(username)님 반가워요!")
                .font(.pretendard(.sb_18))
                .padding([.top], 16)
            Spacer()
            
            BaeminButton(
                isAvailable: true,
                title: "뒤로가기",
                action : {
                    dismiss()
                }
            )
            .padding([.horizontal], 16)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct BaeminButton: View {
    var isAvailable: Bool
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.pretendard(.sb_18))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(isAvailable ? .baeminMint500 : .baeminGray300)
                .cornerRadius(4)
        }
        .disabled(!isAvailable)
    }
}

#Preview {
    WelcomeView(username: "Rudy")
}
