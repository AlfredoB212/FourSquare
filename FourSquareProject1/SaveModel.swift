//
//  SaveModel.swift
//  FourSquareProject1
//
//  Created by Jason on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation

struct SaveModel: Codable {
    let picImage: String
    let name: String
    let address: String
    let latitude: Float
    let longitude: Float
    let review: String
}
