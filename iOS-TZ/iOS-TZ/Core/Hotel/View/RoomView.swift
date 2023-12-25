//
//  RoomView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 20.12.2023.
//

import SwiftUI

struct RoomView: View {
    let imageUrls: [String]
    let name: String
    let peculiarities: [String]
    let price: Int
    let price_per: String
    
    var body: some View {
        VStack{
            ImageCarouselView(imageUrls: imageUrls)
            
            //Room description 1
            Text(name)
              .font(
                Font.custom("SF Pro Display", size: 22)
                  .weight(.medium)
              )
              .foregroundColor(.black)
              .frame(width: 343, alignment: .topLeading)
            
            //Room description 2
            
            LazyVGrid(columns: [GridItem(.fixed(230)), GridItem(.fixed(170))]){
                ForEach(peculiarities, id: \.self) { p in
                    CellView(text: p)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //More about room
            HStack(alignment: .center, spacing: 2) {
                Text("Подробнее о номере")
                  .font(
                    Font.custom("SF Pro Display", size: 16)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                  .padding(.trailing)
                Image("Vector 55")
                    .colorMultiply(.blue)
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .padding(.vertical, 5)
            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
            .cornerRadius(5)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.horizontal)
            
            //Price
            HStack{
                Text("от \(price) ₽")
                  .font(
                    Font.custom("SF Pro Display", size: 30)
                      .weight(.semibold)
                  )
                  .foregroundColor(.black)
                Text(price_per)
                  .font(Font.custom("SF Pro Display", size: 16))
                  .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.horizontal)
            .padding(.top)
            
            //Button
            VStack{
                NavigationLink {
                    ReservationView()
                        .navigationBarHidden(true)
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                        // Headline 3
                        Text("Выбрать номер")
                          .font(
                            Font.custom("SF Pro Display", size: 16)
                              .weight(.medium)
                          )
                          .kerning(0.1)
                          .multilineTextAlignment(.center)
                          .foregroundColor(.white)
                          .frame(width: 343, alignment: .center)
                    }
                    .padding(.horizontal, 0)
                    .padding(.top, 15)
                    .padding(.bottom, 14)
                    .frame(width: 343, height: 48, alignment: .center)
                    .background(.blue)
                }
            }
            .background(.white)
            .cornerRadius(15)
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(imageUrls: [],
                 name: "AA",
                 peculiarities: ["Включен только завтрак", "Кондиционер", "Собственный бассейн"],
                 price: 200000,
                 price_per: "за 7 ночей")
    }
}
