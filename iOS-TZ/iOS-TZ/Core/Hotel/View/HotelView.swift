//
//  HotelView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 20.12.2023.
//

import SwiftUI

struct HotelView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = RoomViewModel()
    var body: some View {
        NavigationView{
            ScrollView{
                Spacer()
                
                VStack{
                    if let rooms = viewModel.roomData{
                        ForEach(rooms.rooms, id: \.self) { room in
                            RoomView(imageUrls: room.image_urls,
                                     name: room.name,
                                     peculiarities: room.peculiarities,
                                     price: room.price,
                                     price_per: room.price_per)
                        }
                    }
                }
                .cornerRadius(15)
            }
            .navigationTitle("Steigenberger Makadi")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                viewModel.fetchData()
            }
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
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
