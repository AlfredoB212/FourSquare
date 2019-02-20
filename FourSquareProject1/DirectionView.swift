//
//  DirectionView.swift
//  FourSquareProject1
//
//  Created by Jason on 2/19/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class DirectionView: UIView {
    
    public lazy var directionMap: MKMapView = {
        let dm = MKMapView()
        dm.backgroundColor = .green
        return dm
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        backgroundColor = .white
        setupMapDirection()
    }
  
    private func setupMapDirection() {
        addSubview(directionMap)
        directionMap.translatesAutoresizingMaskIntoConstraints = false
        directionMap.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        directionMap.bottomAnchor.constraint(equalTo:  safeAreaLayoutGuide.bottomAnchor).isActive = true
        directionMap.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        directionMap.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        directionMap.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
}
