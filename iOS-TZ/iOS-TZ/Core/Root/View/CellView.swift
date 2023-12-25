//
//  CellView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 20.12.2023.
//

import SwiftUI

struct CellView: View {
    var text: String

    var body: some View {
        Text(text)
            .font(
            Font.custom("SF Pro Display", size: 16)
            .weight(.medium)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            .cornerRadius(5)
    }
}


struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(text: "AAAAAA")
    }
}
