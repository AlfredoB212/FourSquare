//
//  VenueTableViewCell.swift
//  FourSquareProject1
//
//  Created by Matthew Huie on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class VenueTableViewCell: UITableViewCell {
    

    lazy var venueImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .purple
        return image
    }()
    
    lazy var venueNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "VenueTableList")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupView()
    }
}

extension VenueTableViewCell {
    private func setupView() {
        setupImage()
        setupLabel()
    }
    
    private func setupImage() {
        addSubview(venueImage)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        venueImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        //venueImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        venueImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        venueImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupLabel() {
        addSubview(venueNameLabel)
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        venueNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        venueNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        venueNameLabel.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 10).isActive = true
        venueNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}
