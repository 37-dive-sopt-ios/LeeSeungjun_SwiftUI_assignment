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
            .padding([.top], 24)
        CategoryTabView()
            .padding([.top], -30)
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
        ZStack {
            Rectangle()
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(.white), Color(.baeminMint100)]),
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
                            .font(Font.pretendard(.bold_16))
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

struct CustomSegmentedPickerView: View {
  @State private var selectedIndex = 0
  private var titles = ["Round Trip", "One Way", "Multi-City"]
  private var colors = [Color.red, Color.green, Color.blue]
  @State private var frames = Array<CGRect>(repeating: .zero, count: 3)

  var body: some View {
    VStack {
      ZStack {
        HStack(spacing: 10) {
          ForEach(self.titles.indices, id: \.self) { index in
            Button(action: { self.selectedIndex = index }) {
              Text(self.titles[index])
            }.padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)).background(
              GeometryReader { geo in
                Color.clear.onAppear { self.setFrame(index: index, frame: geo.frame(in: .global)) }
              }
            )
          }
        }
        .background(
          Capsule().fill(
            self.colors[self.selectedIndex].opacity(0.4))
            .frame(width: self.frames[self.selectedIndex].width,
                   height: self.frames[self.selectedIndex].height, alignment: .topLeading)
            .offset(x: self.frames[self.selectedIndex].minX - self.frames[0].minX)
          , alignment: .leading
        )
      }
      .animation(Animation.easeInOut(duration: 0.3))
      .background(Capsule().stroke(Color.gray, lineWidth: 3))
        
      Picker(selection: self.$selectedIndex, label: Text("What is your favorite color?")) {
        ForEach(0..<self.titles.count) { index in
          Text(self.titles[index]).tag(index)
        }
      }.pickerStyle(SegmentedPickerStyle())

      Text("Value: \(self.titles[self.selectedIndex])")
      Spacer()
    }
  }

  func setFrame(index: Int, frame: CGRect) {
    self.frames[index] = frame
  }
}


struct CustomSegmentedPickerView_Previews: PreviewProvider {
  static var previews: some View {
    CustomSegmentedPickerView()
  }
}


#Preview {
    ContentView()
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

struct CategoryCellData {
    var image = UIImage()
    var name: String
}
