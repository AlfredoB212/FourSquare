//
//  VenueModel.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation
struct FourSquareData: Codable{
    let response: Venue
}

struct Venue: Codable {
    let venues: [Venues]?
}
struct Venues: Codable {
    let id: String
    let name: String
    let location: LocationInfo
}
struct LocationInfo: Codable {
    let lat: Double?
    let lng: Double?
    let distance: Int?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
    let categories: [CategoryInfo]?
}

struct CategoryInfo: Codable {
    let name: String?
}
