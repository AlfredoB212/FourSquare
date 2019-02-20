//
//  FolderModel.swift
//  FourSquareProject1
//
//  Created by Jason on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation

struct FolderModel: Codable {
    let name: String
    var contents: [SaveModel]
}
