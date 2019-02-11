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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView)
        navigationItem.title = "Search"

        
    }
    

    

}
