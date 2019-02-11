//
//  SearchView.swift
//  FourSquareProject1
//
//  Created by Matthew Huie on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class SearchView: UIView {
    
    public lazy var venueSearchBar: UISearchBar = {
        let vsb = UISearchBar()
        vsb.backgroundColor = .purple
        return vsb
    }()

    public lazy var locationTextField: UITextField = {
        let ltf = UITextField()
        ltf.backgroundColor = .blue
        return ltf
    }()
   
    public lazy var venueMap: MKMapView = {
        let vm = MKMapView()
        vm.backgroundColor = .yellow
        return vm
    }()
    
    public lazy var venueTableView: UITableView = {
        let vtv = UITableView()
        vtv.backgroundColor = .red
        return vtv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupView()
    }

}
extension SearchView {
    private func setupView() {
        setupSearchBar()
        setupTextField()
        setupMap()
        setupTableView()
        
    }
    private func setupSearchBar() {
        addSubview(venueSearchBar)
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        venueSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        venueSearchBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        venueSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        venueSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    private func setupTextField() {
        addSubview(locationTextField)
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor, constant: 8).isActive = true
        locationTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationTextField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        locationTextField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    private func setupMap() {
        addSubview(venueMap)
        venueMap.translatesAutoresizingMaskIntoConstraints = false
        venueMap.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 8).isActive = true
        venueMap.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        venueMap.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        venueMap.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        venueMap.heightAnchor.constraint(equalToConstant: 250).isActive = true

    }
    private func setupTableView() {
        addSubview(venueTableView)
        venueTableView.translatesAutoresizingMaskIntoConstraints = false
        venueTableView.topAnchor.constraint(equalTo: venueMap.bottomAnchor, constant: 8).isActive = true
        venueTableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        venueTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        venueTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        venueTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
    
}
