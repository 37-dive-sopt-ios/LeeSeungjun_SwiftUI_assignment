//
//  Test.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/10/25.
//

import SwiftUI
import Combine

class CounterModel: ObservableObject {
    @Published var count: Int = 0
    let id = UUID()
    
    init() { }
}

struct RootView: View {
    @State private var refreshTrigger = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("부모 뷰 (Root) \(refreshTrigger)")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
            
            Text("아래 버튼을 누르면 부모 뷰가 갱신되면서\n자식 뷰들을 다시 찍어냅니다.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button("부모 뷰 강제 업데이트 (새로고침)") {
                refreshTrigger.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Divider()
            
            HStack(spacing: 20) {
                StateChildView()
                ObservedChildView()
            }
        }
    }
}

struct StateChildView: View {
    @StateObject private var model = CounterModel()
    
    var body: some View {
        VStack {
            Text("StateObject")
                .font(.headline)
                .foregroundColor(.green)
            Text("값: \(model.count)")
                .font(.title)
                .bold()
            
            Button("+1 증가") {
                model.count += 1
            }
            .padding(8)
            .background(Color.green.opacity(0.2))
            .cornerRadius(8)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(10)
    }
}

struct ObservedChildView: View {
    @ObservedObject private var model = CounterModel()
    
    var body: some View {
        VStack {
            Text("ObservedObject")
                .font(.headline)
                .foregroundColor(.red)
            Text("값: \(model.count)")
                .font(.title)
                .bold()
            
            Button("+1 증가") {
                model.count += 1
            }
            .padding(8)
            .background(Color.red.opacity(0.2))
            .cornerRadius(8)
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    RootView()
}
