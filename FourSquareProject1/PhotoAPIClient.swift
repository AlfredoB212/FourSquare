//
//  PhotoAPIClient.swift
//  FourSquareProject1
//
//  Created by Matthew Huie on 2/13/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation

final class PhotoAPIClient {
    private init () {}
    static func getPhoto (venueId: String, completionHandler: @escaping (AppError?, [ItemInfo]?) -> Void) {
        let endpointURLString = "https://api.foursquare.com/v2/venues/\(venueId)/photos?client_id=\(APIKeys.clientID)&client_secret=\(APIKeys.clientSecret)&v=20190201"
        guard let url = URL(string: endpointURLString) else {
            completionHandler(AppError.badURL(endpointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                completionHandler(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                    return
            }
            if let data = data {
                do {
                    let venueImage = try JSONDecoder().decode(Photos.self, from: data)
                    completionHandler(nil, venueImage.response.photos.items)
                } catch {
                    print(error)
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        } .resume()
    }
}
