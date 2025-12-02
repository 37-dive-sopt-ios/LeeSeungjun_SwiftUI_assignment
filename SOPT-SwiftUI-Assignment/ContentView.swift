//
//  ContentView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationBar()
            .padding([.horizontal], 16)
        SearchBar()
            .padding([.horizontal], 16)
            .padding([.top], 4)
        EventPromotionView()
            .padding([.horizontal], 16)
            .padding([.top], 24)
        Spacer()
    }
}

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

struct EventPromotionView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
