//
//  HotelViewModel.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 22.12.2023.
//

import SwiftUI

class HotelViewModel: ObservableObject {
    @Published var hotelData: HotelData?
    @Published var isLoading = true
    
    func fetchData(){
        guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let self = self else { return }
            guard let data = data, error == nil else { return }
            do{
                let hotelData = try JSONDecoder().decode(HotelData.self, from: data)
                DispatchQueue.main.async {
                    self.hotelData = hotelData
                    self.isLoading = false
                    print("LOADED!")
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
