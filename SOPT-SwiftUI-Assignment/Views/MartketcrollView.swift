//
//  MartketcrollView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/5/25.
//

import SwiftUI

struct MartketcrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 13) {
                ForEach(MarketData.data, id:\.name) { data in
                    Button {
                        
                    } label: {
                        MarketCell(data: data)
                    }
                }
            }
            .padding([.horizontal], 16)
        }
        .padding([.vertical], 11)
        .background(Color(.white))
    }
}
