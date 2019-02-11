//
//  AppError.swift
//  FourSquareProject1
//
<<<<<<< HEAD
//  Created by Alfredo Barragan on 2/11/19.
=======
//  Created by Alfredo Barragan on 2/8/19.
>>>>>>> 13900dbe1a78505b10b2ccc8df4ac59d42af8f32
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation
enum AppError: Error {
    case badURL(String)
    case jsonDecodingError(Error)
    case networkError(Error)
    case badStatusCode(String)
    case propertyListEncodingError(Error)
    
    public func errorMessage() -> String {
        switch self {
        case .badURL(let message):
            return "bad url: \(message)"
        case .jsonDecodingError(let error):
            return "json decoding error: \(error)"
        case .networkError(let error):
            return "network error: \(error)"
        case .badStatusCode(let message):
            return "bad status code: \(message)"
        case .propertyListEncodingError(let error):
            return "property list encoding error: \(error)"
        }
    }
}
