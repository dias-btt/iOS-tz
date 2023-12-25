//
//  ContentView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 18.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HotelViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    //Images carousel
                    ZStack{
                        if let imageUrls = viewModel.hotelData?.image_urls {
                            ImageCarouselView(imageUrls: imageUrls)
                        }
                    }
                    
                    HotelRatingView(hotel_name: viewModel.hotelData?.name ?? "", hotel_rating: viewModel.hotelData?.rating ?? -1 , rating_name: viewModel.hotelData?.rating_name ?? "", hotel_address: viewModel.hotelData?.adress ?? "")
                    
                    //Price
                    HStack{
                        if let minimalPrice = viewModel.hotelData?.minimal_price{
                            Text("от \(minimalPrice) ₽")
                                .font(
                                    Font.custom("SF Pro Display", size: 30)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.black)
                        }
                        if let priceForIt = viewModel.hotelData?.price_for_it{
                            Text(priceForIt)
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)
                }
                .background(.white)
                .cornerRadius(15)

                Spacer()
                
                VStack{
                    Text("Об отеле")
                      .font(
                        Font.custom("SF Pro Display", size: 22)
                          .weight(.medium)
                      )
                      .foregroundColor(.black)
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                      .padding(.horizontal)
                      .padding(.top)
                    
                    //Hotel description 1
                    VStack{
                        if let peculiarities = viewModel.hotelData?.about_the_hotel.peculiarities{
                            HStack{
                                CellView(text: peculiarities[0])
                                CellView(text: peculiarities[1])
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.horizontal)
                            HStack{
                                CellView(text: peculiarities[2])
                                CellView(text: peculiarities[3])
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.horizontal)
                        }
                    }
                    
                    //Hotel description 2
                    if let description = viewModel.hotelData?.about_the_hotel.description{
                        Text(description)
                            .font(Font.custom("SF Pro Display", size: 16))
                            .foregroundColor(.black.opacity(0.9))
                            .frame(width: 343, alignment: .topLeading)
                    }
                    
                    //Hotel desctiption 3
                    VStack(alignment: .trailing, spacing: 10) {
                        hotelDescriptionCell(icon: Image("emoji-happy"), text1: "Удобства")
                        Divider()
                        hotelDescriptionCell(icon: Image("tick-square"), text1: "Что включено")
                        Divider()
                        hotelDescriptionCell(icon: Image("close"), text1: "Что не включено")
                    }
                    .padding(15)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .cornerRadius(15)
            }
                .background(.white)
                .cornerRadius(15)
                
                Spacer()
                
                VStack{
                    NavigationLink {
                        HotelView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack(alignment: .center, spacing: 0) {
                            // Headline 3
                            Text("К выбору номера")
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
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct hotelDescriptionCell: View{
    var icon: Image
    var text1: String
    
    var body: some View{
        HStack{
            icon
            .frame(width: 24, height: 24)
            .padding(.leading)
            VStack{
                Text(text1)
                  .font(
                    Font.custom("SF Pro Display", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.17, green: 0.19, blue: 0.21))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
                Text("Самое необходимое")
                  .font(
                    Font.custom("SF Pro Display", size: 14)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            Image("Vector 55")
            .frame(width: 6, height: 12)
            .padding(.trailing)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
