//
//  HotelRatingView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 22.12.2023.
//

import SwiftUI

struct HotelRatingView: View {
    @StateObject private var viewModel = HotelViewModel()
    let hotel_name: String
    let hotel_rating: Int
    let rating_name: String
    let hotel_address: String
    
    var body: some View {
        VStack{
            //Rating
            HStack(alignment: .center, spacing: 2) {
                Image("star")
                .frame(width: 15, height: 15)
                Text("\(hotel_rating) \(rating_name)")
                  .font(
                    Font.custom("SF Pro Display", size: 16)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
            .cornerRadius(5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top)
            
            //Name of Hotel
            Text(hotel_name)
              .font(
                Font.custom("SF Pro Display", size: 22)
                  .weight(.medium)
              )
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.horizontal)
            
            //Location
            Text(hotel_address)
              .font(
                Font.custom("SF Pro Display", size: 14)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
              .frame(maxWidth: .infinity, alignment: .topLeading)
              .padding(.horizontal)
              .padding(.top, -5)
        }
    }
}

struct HotelRatingView_Previews: PreviewProvider {
    static var previews: some View {
        HotelRatingView(hotel_name: "Hotel name", hotel_rating: 4, rating_name: "Good", hotel_address: "Madinat Makadi, Safaga Road, Makadi Bay, Египет")
    }
}
