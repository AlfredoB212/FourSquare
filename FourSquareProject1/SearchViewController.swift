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
    
    let searchView = SearchView()
    var long = 40.7
    var lat = -74.0
    var query = "pizza"
    
    var venues = [Venues]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.venueTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView)
        navigationItem.title = "Search"
        searchView.venueTableView.dataSource = self
        searchView.venueTableView.delegate = self
        getVenues()

        
    }
    
    func getVenues() {
        VenueAPIClient.getVenuesList(long: long, lat: lat, query: query) { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.venues = data
            }
        }
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
                        print(error.errorMessage())
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
        
    }
    
}
