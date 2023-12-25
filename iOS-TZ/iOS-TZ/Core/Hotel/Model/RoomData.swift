//
//  RoomData.swift
//  iOS-TZ
//
//  Created by Диас Сайынов on 25.12.2023.
//

import Foundation

struct RoomData: Hashable, Codable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}

struct Rooms: Hashable, Codable {
    let rooms: [RoomData]
}
