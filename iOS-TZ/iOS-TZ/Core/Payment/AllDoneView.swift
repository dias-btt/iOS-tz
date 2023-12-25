//
//  AllDoneView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 25.12.2023.
//

import SwiftUI

struct AllDoneView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 44, height: 44)
                      .background(
                        Image("party")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 44, height: 44)
                          .clipped()
                      )
                }
                .padding(25)
                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                .cornerRadius(1000)
                
                Text("Ваш заказ принят в работу")
                  .font(
                    Font.custom("SF Pro Display", size: 22)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black)
                  .frame(width: 343, alignment: .top)
                
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                  .font(Font.custom("SF Pro Display", size: 16))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                  .frame(width: 329, alignment: .top)
                Spacer()
                
                Divider()
                
                NavigationLink {
                    ContentView()
                        .navigationBarHidden(true)
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                        // Headline 3
                        Text("Супер!")
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
                    .cornerRadius(15)
                }

            }
        }
        .navigationTitle("Заказ оплачен")
        .navigationBarTitleDisplayMode(.inline)
        .background(.white)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("vector-3")
                }
            }
        }
    }
}

struct AllDoneView_Previews: PreviewProvider {
    static var previews: some View {
        AllDoneView()
    }
}
