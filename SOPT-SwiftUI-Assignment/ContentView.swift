//
//  ContentView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            NavigationBar()
                .padding([.horizontal], 16)
            SearchBar()
                .padding([.horizontal], 16)
                .padding([.top], 4)
            EventPromotionView()
                .padding([.top], 24)
            CategoryTabView()
                .padding([.top], -30)
            CategoryScrollView()
            MartketcrollView()
                .padding([.top], 10)
            BannerScrollView()
                .padding([.top], 10)
            Spacer()
        }
        .background(.baeminBackgroundWhite)
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
        ZStack {
            Rectangle()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(.baeminBackgroundWhite), Color(.baeminMint100)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            .frame(width: .infinity, height: 100)
            HStack {
                VStack(alignment: .leading) {
                    Image(.bmart)
                    HStack {
                        Text("전상품 쿠폰팩 + 60%특가")
                            .font(Font.pretendard(.bold_16))
                        Image(.rightArrow)
                    }
                }
                Spacer()
            }
            .padding([.top], -20)
            .padding([.horizontal], 16)
        }
    }
}

struct CategoryTabView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(CategoryData.data.enumerated(), id: \.offset) { index, data in
                    Button {
                        
                    } label: {
                        Text("\(data.name)")
                            .font(Font.pretendard(.bold_18))
                            .tint(.gray)
                            .padding([.horizontal], 7)
                    }
                }
            }
            .padding([.horizontal], 10)
        }
        .frame(height: 48)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .baeminMint300, radius: 4, x: 0, y: -6)
    }
}

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

struct CategorySetCell: View {
    
    var data: CategoryData
    
    var body: some View {
        VStack {
            Grid(
                alignment: .center,
                horizontalSpacing: 12,
                verticalSpacing: 12,
            ) {
                GridRow {
                    ForEach([
                        CategoryCellData(image: .oneBowl, name: "한그릇"),
                        CategoryCellData(image: .chicken, name: "치킨"),
                        CategoryCellData(image: .cafeDesert, name: "카페·디저트"),
                        CategoryCellData(image: .pizza, name: "피자"),
                        CategoryCellData(image: .snackFood, name: "분식")]) { data in
                            CategoryCell(data: data)
                        }
                }
                GridRow {
                    ForEach([
                        CategoryCellData(image: .meat, name: "고기"),
                        CategoryCellData(image: .soup, name: "찜·탕"),
                        CategoryCellData(image: .lateFood, name: "야식"),
                        CategoryCellData(image: .fastfood, name: "패스트푸드"),
                        CategoryCellData(image: .pickUp, name: "픽업")]) { data in
                            CategoryCell(data: data)
                        }
                }
            }
            .padding([.vertical], 10)
            .padding([.horizontal], 16)
            Divider()
            Button {
                
            } label: {
                HStack(spacing: 0) {
                    Text("음식배달")
                        .font(Font.pretendard(.body_b_14))
                    Text("에서 더보기")
                        .font(Font.pretendard(.body_m_14))
                    Image(.rightArrow)
                        .frame(width: 20)
                }
                .frame(height: 26)
                .tint(.black)
            }
            Rectangle()
                .foregroundStyle(.white)
                .frame(height: 2)
                .frame(width: UIScreen.main.bounds.width)
        }
        .background(.white)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct CategoryCell: View {
    
    var data: CategoryCellData
    
    var body: some View {
        VStack {
            Image(uiImage: data.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 58, height: 58)
            Text(data.name)
                .font(Font.pretendard(.body_r_14))
        }
        .frame(width: 62, height: 78)
    }
}

struct MarketCell: View {
    
    var data: MarketData
    
    var body: some View {
        VStack {
            Image(uiImage: data.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 58, height: 58)
            Text(data.name)
                .font(Font.pretendard(.body_r_14))
                .foregroundStyle(.black)
        }
        .frame(width: 62, height: 78)
    }
}

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

struct BannerScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(BannerData.data, id: \.image) { data in
                    Image(uiImage: data.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: 114)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    ContentView()
}

struct BannerData {
    var image: UIImage
    
    static let data: [BannerData] = [
        BannerData(image: .banner01),
        BannerData(image: .banner02),
        BannerData(image: .banner03),
    ]
}

struct CategoryData: Identifiable {
    var id: String
    var name: String
    var cells: [CategoryCellData]
    
    init(name: String, cells: [CategoryCellData]) {
        self.id = name
        self.name = name
        self.cells = cells
    }
    
    static let data = [
        CategoryData( name: "음식배달", cells: [
            CategoryCellData(image: .oneBowl, name: "한그릇"), CategoryCellData(image: .chicken, name: "치킨"),
            CategoryCellData(image: .cafeDesert, name: "카페·디저트"), CategoryCellData(image: .pizza, name: "피자"),
            CategoryCellData(image: .snackFood, name: "분식"), CategoryCellData(image: .meat, name: "고기"),
            CategoryCellData(image: .soup, name: "찜·탕"), CategoryCellData(image: .lateFood, name: "야식"),
            CategoryCellData(image: .fastfood, name: "패스트푸드"), CategoryCellData(image: .pickUp, name: "픽업"),]),
        CategoryData(name: "픽업", cells: []),
        CategoryData(name: "장보기·쇼핑", cells: []),
        CategoryData(name: "선물하기", cells: []),
        CategoryData(name: "헤택모아보기", cells: []),
        CategoryData(name: "배민푸드스타", cells: []),
    ]
}

struct CategoryCellData: Identifiable {
    var id: String
    var image = UIImage()
    var name: String
    
    init(image: UIImage, name: String) {
        self.id = name
        self.name = name
        self.image = image
    }
}

struct MarketData {
    var name: String
    var image: UIImage
    
    static let data: [MarketData] = [
        MarketData(name: "B마트", image: .baeminMart),
        MarketData(name: "CU", image: .cu),
        MarketData(name: "이마트슈퍼", image: .emart),
        MarketData(name: "홈플러스", image: .homeplus),
        MarketData(name: "GS25", image: .gs25),
        MarketData(name: "홈플슈퍼", image: .homeplusSuper),
        MarketData(name: "이마트24", image: .emart24),
        MarketData(name: "GS더프레시", image: .gsTheFresh),
        MarketData(name: "JAJU", image: .jaju),
        MarketData(name: "펫마트", image: .petMart),
        ]
}
