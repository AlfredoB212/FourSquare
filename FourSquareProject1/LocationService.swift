//
//  LocationService.swift
//  FourSquareProject1
//
//  Created by J on 2/21/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate: AnyObject {
  func didReceiveError(_ service: LocationService, error: Error)
  func didReceiveCoordinate(_ service:LocationService, coordinate:CLLocationCoordinate2D)
}

final class LocationService {
  
  public weak var delegate: LocationServiceDelegate?
  
  public func getCoordinate( addressString : String) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placemarks, error) in
      if let location = placemarks?.first?.location {
          self.delegate?.didReceiveCoordinate(self , coordinate: location.coordinate)
        } else if let error = error {
          self.delegate?.didReceiveError(self, error: error)
      }
    }
  }
}
