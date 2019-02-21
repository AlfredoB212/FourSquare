//
//  SearchViewController.swift
//  FourSquareProject1
//
//  Created by Matthew Huie on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class SearchViewController: UIViewController {
    var locationManager: CLLocationManager!
    let searchView = SearchView()
    var location = "Brooklyn" {
        didSet {
            getNearby()
        }
    }
    var query = "pizza" {
        didSet {
            if let _ = currentLocation {
                getVenues()
            } else {
                getNearby()
            }
        }
    }
    var annotations = [MKAnnotation]()
    var venues = [Venues]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.venueTableView.reloadData()
                self.makeAnnotations()
            }
        }
    }
    var currentLocation: CLLocation? {
        didSet {
            getVenues()
        }
        
    }
    var locationService = LocationService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView)
        navigationItem.title = "Search"
        setupDelegates()
        setupCLManager()
        locationService.getCoordinate(addressString: location)
    }
  
    func setupDelegates() {
      searchView.venueTableView.dataSource = self
      searchView.venueTableView.delegate = self
      searchView.venueSearchBar.delegate = self
      searchView.locationSearchBar.delegate = self
      locationService.delegate = self
  }
    
    func setupCLManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            searchView.venueMap.showsUserLocation = true
            getVenues()
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            getNearby()
            locationManager.startUpdatingLocation()
            searchView.venueMap.showsUserLocation = true
        }
    }
    
    
    func getVenues() {
        
        guard let coordinate = currentLocation?.coordinate else { return }
        let lat = Double(coordinate.latitude)
        let long = Double(coordinate.longitude)
        VenueAPIClient.getVenuesList(long: long, lat: lat, query: query) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.venues = data
            }
        }
    }
    
    func getNearby() {
        VenueAPIClient.getNearbyVenuesList(location: location, query: query) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.venues = data
            }
        }
    }
    
    func makeAnnotations(){
        searchView.venueMap.removeAnnotations(annotations)
        for venue in venues {
            let annotation = MKPointAnnotation()
            annotation.coordinate = venue.coordinate
            annotation.title = venue.name
            annotations.append(annotation)
        }
        searchView.venueMap.addAnnotations(annotations)
    }
    
}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchView.venueTableView.dequeueReusableCell(withIdentifier: "VenueTableList", for: indexPath) as? VenueTableViewCell else {return UITableViewCell()}
        let cellToSet = venues[indexPath.row]
        PhotoAPIClient.getPhoto(venueId: cellToSet.id) { (error, data) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.errorMessage())
                } else if let data = data {
                    let prefix = data[0].prefix
                    let suffix = data[0].suffix
                    let urlString = prefix + "original" + suffix
                    ImageHelper.fetchImageFromNetwork(urlString: urlString, completion: { (error, image) in
                        if let error = error {
                          cell.venueImage.image = UIImage(named: "placeHolder")
                        } else if let image = image {
                            cell.venueImage.image = image
                        }
                    })
                }
            }
        }
        cell.venueNameLabel.text = cellToSet.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venue = venues[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.venue = venue
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchView.venueSearchBar.text {
            query = searchTerm
            resignFirstResponder()
        }
        if let locationTerm = searchView.locationSearchBar.text {
            location = locationTerm
            resignFirstResponder()
            
        }
    }
}

extension SearchViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("no locations found")
            return
        }
        currentLocation = location
        let currentRegion = MKCoordinateRegion(center: currentLocation!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        searchView.venueMap.setRegion(currentRegion, animated: true)
    }
    
    
}

extension SearchViewController: LocationServiceDelegate {
  func didReceiveError(_ service: LocationService, error: Error) {
    print(error)
  }
  
  func didReceiveCoordinate(_ service: LocationService, coordinate: CLLocationCoordinate2D) {
    let currentRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    searchView.venueMap.setRegion(currentRegion, animated: true)
  }
  
}
