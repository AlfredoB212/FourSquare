//
//  PhotoModel.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation
struct Photos: Codable {
    let response: ResponseInfo
}
struct ResponseInfo: Codable {
    let photos: PhotoInfo
}

struct PhotoInfo: Codable {
    let items: [ItemInfo]
}

struct ItemInfo: Codable {
    let prefix: String
    let suffix: String
}
