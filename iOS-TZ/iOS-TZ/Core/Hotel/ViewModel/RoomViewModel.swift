//
//  RoomViewModel.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 25.12.2023.
//

import SwiftUI

class RoomViewModel: ObservableObject {
    @Published var roomData: Rooms?
    
    func fetchData(){
        print("fetching rooms")
        guard let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let self = self else { return }
            guard let data = data, error == nil else { return }
            do{
                let roomData = try JSONDecoder().decode(Rooms.self, from: data)
                DispatchQueue.main.async {
                    self.roomData = roomData
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
