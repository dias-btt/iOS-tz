//
//  ReservationView.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 22.12.2023.
//

import SwiftUI
import iPhoneNumberField

struct ReservationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = ReservationViewModel()
    
    @State private var phoneNumber: String = ""
    @State private var email = ""
    @State private var isPhoneEditing = false
    @State private var isEmailValid = true

    @State private var firstTouristVisible = true
    @State private var firstTouristName = ""
    @State private var firstTouristLastName = ""
    @State private var firstTouristBirthDate = ""
    @State private var firstTouristCitizenship = ""
    @State private var firstTouristPassport = ""
    @State private var firstTouristPassportDate = ""
    
    @State private var addTourist = false
    @State private var showTouristNumber: Int = 1
    
    @State private var secondTouristVisible = false
    @State private var secondTouristAdded = false
    @State private var secondTouristName = ""
    @State private var secondTouristLastName = ""
    @State private var secondTouristBirthDate = ""
    @State private var secondTouristCitizenship = ""
    @State private var secondTouristPassport = ""
    @State private var secondTouristPassportDate = ""
    
    @State private var thirdTouristVisible = false
    @State private var thirdTouristAdded = false
    @State private var thirdTouristName = ""
    @State private var thirdTouristLastName = ""
    @State private var thirdTouristBirthDate = ""
    @State private var thirdTouristCitizenship = ""
    @State private var thirdTouristPassport = ""
    @State private var thirdTouristPassportDate = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    if let name = viewModel.reservationData?.hotel_name,
                       let rating = viewModel.reservationData?.horating,
                       let ratingName = viewModel.reservationData?.rating_name,
                       let address = viewModel.reservationData?.hotel_adress,
                       let departure = viewModel.reservationData?.departure,
                       let destination = viewModel.reservationData?.arrival_country,
                       let date_start = viewModel.reservationData?.tour_date_start,
                       let date_stop = viewModel.reservationData?.tour_date_stop,
                       let nights = viewModel.reservationData?.number_of_nights,
                       let room = viewModel.reservationData?.room,
                       let nutrition = viewModel.reservationData?.nutrition,
                       let tour = viewModel.reservationData?.tour_price,
                       let fuel = viewModel.reservationData?.fuel_charge,
                       let service = viewModel.reservationData?.service_charge{
                        
                        VStack{
                            HotelRatingView(hotel_name: name, hotel_rating: rating, rating_name: ratingName, hotel_address: address)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        
                        VStack{
                            ReservationDetailsView(title: "Вылет", value: departure)
                            ReservationDetailsView(title: "Страна, город", value: destination)
                            ReservationDetailsView(title: "Даты", value: "\(date_start) - \(date_stop)")
                            ReservationDetailsView(title: "Кол-во ночей", value: String(nights))
                            ReservationDetailsView(title: "Отель", value: name)
                            ReservationDetailsView(title: "Номер", value: room)
                            ReservationDetailsView(title: "Питание", value: nutrition)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        
                        //phone and email
                        VStack{
                            Text("Информация о покупателе")
                              .font(
                                Font.custom("SF Pro Display", size: 22)
                                  .weight(.medium)
                              )
                              .foregroundColor(.black)
                              .frame(width: 343, alignment: .topLeading)
                            iPhoneNumberField("+7 (***) ***-**-**", text: $phoneNumber, isEditing: $isPhoneEditing)
                                .foregroundColor(Color(red: 0.66, green: 0.67, blue: 0.72))
                                .prefixHidden(false)
                                .padding(.leading, 16)
                                .padding(.trailing, 172)
                                .padding(.vertical, 10)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                                .cornerRadius(10)
                            TextField("Почта", text: $email, onCommit: validateEmail)
                                .padding(.leading, 16)
                                .padding(.trailing, 134)
                                .padding(.vertical, 10)
                                .background(isEmailValid ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(red: 0.92, green: 0.34, blue: 0.34)
                                    .opacity(0.15))
                                .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
                                .cornerRadius(10)
                            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                              .font(Font.custom("SF Pro Display", size: 14))
                              .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                              .frame(width: 343, alignment: .topLeading)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        
                        //first tourist
                        TouristInfoView(
                            nthTourist: 1,
                            isVisible: $firstTouristVisible,
                            name: $firstTouristName,
                            lastName: $firstTouristLastName,
                            birthDate: $firstTouristBirthDate,
                            citizenship: $firstTouristCitizenship,
                            passport: $firstTouristPassport,
                            passportDate: $firstTouristPassportDate
                        )
                        
                        //second tourist
                        if showTouristNumber == 2 || secondTouristAdded{
                            TouristInfoView(
                                nthTourist: 2,
                                isVisible: $secondTouristVisible,
                                name: $secondTouristName,
                                lastName: $secondTouristLastName,
                                birthDate: $secondTouristBirthDate,
                                citizenship: $secondTouristCitizenship,
                                passport: $secondTouristPassport,
                                passportDate: $secondTouristPassportDate
                            )
                        }
                        
                        //third tourist
                        if showTouristNumber == 3 || thirdTouristAdded{
                            TouristInfoView(
                                nthTourist: 3,
                                isVisible: $thirdTouristVisible,
                                name: $thirdTouristName,
                                lastName: $thirdTouristLastName,
                                birthDate: $thirdTouristBirthDate,
                                citizenship: $thirdTouristCitizenship,
                                passport: $thirdTouristPassport,
                                passportDate: $thirdTouristPassportDate
                            )
                        }
                        
                        //add tourist
                        VStack{
                            HStack {
                                Text("Добавить туриста")
                                  .font(
                                    Font.custom("SF Pro Display", size: 22)
                                      .weight(.medium)
                                  )
                              .foregroundColor(.black)
                                Spacer()
                                Button {
                                    addTourist.toggle()
                                    showTouristNumber = showTouristNumber + 1
                                    if showTouristNumber == 2{
                                        secondTouristAdded = true
                                    } else if showTouristNumber == 3{
                                        thirdTouristAdded = true
                                    }
                                } label: {
                                    ZStack {
                                        Image("add")
                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 12)
                                    .frame(height: 32.00001, alignment: .center)
                                    .background(Color(red: 0.05, green: 0.45, blue: 1))
                                    .cornerRadius(6)
                                }
                            }
                            .padding(.leading)
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        
                        //price
                        VStack{
                            ReservationDetailsView(title: "Тур", value: String(tour) + "₽")
                            ReservationDetailsView(title: "Топливный сбор", value: String(fuel) + "₽")
                            ReservationDetailsView(title: "Сервисный сбор", value: String(service) + "₽")
                            ReservationDetailsView(title: "К оплате", value: String(tour+fuel+service) + "₽")
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        
                        //pay
                        VStack{
                            NavigationLink(
                                destination: AllDoneView().navigationBarHidden(true),
                                label: {
                                    HStack(alignment: .center, spacing: 0) {
                                        // Headline 3
                                        Text("Оплатить \(tour + fuel + service) ₽")
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
                                    .background(areAllFieldsFilled() ? .blue : Color.gray) // Use gray or any other color when disabled
                                    .cornerRadius(15)
                                }
                            )
                            .disabled(!areAllFieldsFilled()) // Disable the button when required fields are not filled
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(12)
                        
                    }
                }
            }
            .navigationTitle("Бронирование")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image("vector-3")
                    }
                }
            }
            .onAppear{
                viewModel.fetchData()
            }
        }
    }
    
    private func validateEmail() {
        isEmailValid = isValidEmail(email)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
    
    private func areAllFieldsFilled() -> Bool {
        // Add conditions for other fields if needed
        switch showTouristNumber {
            case 1:
                return !firstTouristName.isEmpty &&
                       !firstTouristLastName.isEmpty &&
                       !firstTouristBirthDate.isEmpty &&
                       !firstTouristCitizenship.isEmpty &&
                       !firstTouristPassport.isEmpty &&
                       !firstTouristPassportDate.isEmpty && !phoneNumber.isEmpty && !email.isEmpty

            case 2:
                return !secondTouristName.isEmpty &&
                       !secondTouristLastName.isEmpty &&
                       !secondTouristBirthDate.isEmpty &&
                       !secondTouristCitizenship.isEmpty &&
                       !secondTouristPassport.isEmpty &&
                       !secondTouristPassportDate.isEmpty && !phoneNumber.isEmpty && !email.isEmpty

            case 3:
                return !thirdTouristName.isEmpty &&
                       !thirdTouristLastName.isEmpty &&
                       !thirdTouristBirthDate.isEmpty &&
                       !thirdTouristCitizenship.isEmpty &&
                       !thirdTouristPassport.isEmpty &&
                       !thirdTouristPassportDate.isEmpty && !phoneNumber.isEmpty && !email.isEmpty

            default:
                return false
            }
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.leading, 16)
            .padding(.trailing, 134)
            .padding(.vertical, 10)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
            .cornerRadius(10)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}
