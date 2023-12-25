//
//  ReservationDetailsView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 25.12.2023.
//

import SwiftUI

struct ReservationDetailsView: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            Spacer()
            Text(value)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(.black)
                .frame(width: 203, alignment: .topLeading)
        }
        .padding(.top)
    }
}

struct ReservationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailsView(title: "Вылет", value: "Москва")
    }
}
