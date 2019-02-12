//
//  VenueCell.swift
//  FourSquareProject1
//
//  Created by J on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class VenueCell: UICollectionViewCell {
    public lazy var venueNameLabel: UILabel = {
      let label = UILabel()
      return label
    }()
    public lazy var venueImageView: UIImageView = {
      let iv = UIImageView()
      return iv
    }()
    public lazy var venueAddressLabel: UILabel = {
      let label = UILabel()
      return label
    }()
    public lazy var reviewTextField: UITextField = {
      let textfield = UITextField()
      return textfield
    }()

  override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  override func layoutSubviews() {
    backgroundColor = .white
    commonInit()
  }

  private func commonInit(){
    setupVenueImageView()
    setupVenueNameLabel()
    setupVenueAddressLabel()
    setupReviewTextField()
  }
  
  public func configureCell(){
    venueNameLabel.text = "venue name"
    venueImageView.image = UIImage(named:"search30")
    venueAddressLabel.text = "Address Name"
  }
  
  private func setupVenueImageView(){
      addSubview(venueImageView)
      venueImageView.translatesAutoresizingMaskIntoConstraints = false
      venueImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
      venueImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
}

  private func setupVenueNameLabel() {
    addSubview(venueNameLabel)
    venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
    venueNameLabel.topAnchor.constraint(equalTo: venueImageView.bottomAnchor, constant: 10).isActive = true
    venueNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    venueNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
  }
  private func setupVenueAddressLabel() {
    addSubview(venueAddressLabel)
    venueAddressLabel.translatesAutoresizingMaskIntoConstraints = false
    venueAddressLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 10).isActive = true
    venueAddressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    venueAddressLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
  }

private func setupReviewTextField(){
    addSubview(reviewTextField)
    reviewTextField.translatesAutoresizingMaskIntoConstraints = false
    reviewTextField.topAnchor.constraint(equalTo: venueAddressLabel.topAnchor, constant: 10).isActive = true
    reviewTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    reviewTextField.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
  }

  
}
