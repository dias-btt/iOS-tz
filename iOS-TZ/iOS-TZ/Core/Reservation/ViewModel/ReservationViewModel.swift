//
//  ReservationViewModel.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 25.12.2023.
//

import SwiftUI

class ReservationViewModel: ObservableObject {
    @Published var reservationData: ReservationData?
    
    func fetchData(){
        print("fetching reservation")
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let self = self else { return }
            guard let data = data, error == nil else { return }
            do{
                let reservationData = try JSONDecoder().decode(ReservationData.self, from: data)
                DispatchQueue.main.async {
                    self.reservationData = reservationData
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
