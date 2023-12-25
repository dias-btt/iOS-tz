//
//  TouristInfoView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 25.12.2023.
//

import SwiftUI

struct TouristInfoView: View {
    var nthTourist: Int
    @Binding var isVisible: Bool
    @Binding var name: String
    @Binding var lastName: String
    @Binding var birthDate: String
    @Binding var citizenship: String
    @Binding var passport: String
    @Binding var passportDate: String
    var tourist: String {
        switch nthTourist {
        case 2:
            return "Второй"
        case 3:
            return "Третий"
        case 4:
            return "Четвертый"
        case 5:
            return "Пятый"
        default:
            return "Турист"
        }
    }
    var body: some View {
        VStack {
            HStack {
                Text("\(tourist) турист")
                    .font(
                        Font.custom("SF Pro Display", size: 22)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Spacer()
                Button {
                    isVisible.toggle()
                } label: {
                    ZStack {
                        Image(isVisible ? "up" : "down")
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 8)
                    .padding(.vertical, 12)
                    .frame(width: 32.00001, height: 32.00001, alignment: .center)
                    .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                    .cornerRadius(6)
                }
            }
            .padding(.leading)

            if isVisible {
                VStack {
                    CustomTextField(placeholder: "Имя", text: $name)
                    CustomTextField(placeholder: "Фамилия", text: $lastName)
                    CustomTextField(placeholder: "Дата рождения", text: $birthDate)
                    CustomTextField(placeholder: "Гражданство", text: $citizenship)
                    CustomTextField(placeholder: "Номер загранпаспорта", text: $passport)
                    CustomTextField(placeholder: "Срок действия загранпаспорта", text: $passportDate)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)
    }
}
