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
      label.backgroundColor = .white
      return label
    }()
    public lazy var venueImageView: UIImageView = {
      let iv = UIImageView()
      return iv
    }()
    public lazy var venueAddressLabel: UILabel = {
      let label = UILabel()
      label.backgroundColor = .white
      return label
    }()
    public lazy var reviewTextView: UITextView = {
      let textView = UITextView()
      textView.backgroundColor = .white
      textView.isEditable = false
      return textView
    }()
    public lazy var deleteButton: UIButton = {
    let button = UIButton()
    button.setTitle("Delete", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 5
    button.layer.zPosition = 10
    return button
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
    setupDeleteButton()
  }
  
  public func configureCell(venue:SaveModel,selector:Selector,target:Any){
    venueNameLabel.text = venue.name
    venueImageView.image = UIImage(named:venue.picImage)
    venueAddressLabel.text = venue.address
    reviewTextView.text = venue.review
    deleteButton.backgroundColor = .white
    deleteButton.addTarget(target, action: selector, for: .touchUpInside)
  }
  
  private func setupVenueImageView(){
      addSubview(venueImageView)
      venueImageView.translatesAutoresizingMaskIntoConstraints = false
      venueImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
      venueImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
      venueImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
}

  private func setupVenueNameLabel() {
    addSubview(venueNameLabel)
    venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
    venueNameLabel.topAnchor.constraint(equalTo: venueImageView.bottomAnchor, constant: 10).isActive = true
    venueNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
    venueNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
    venueNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
  }
  private func setupVenueAddressLabel() {
    addSubview(venueAddressLabel)
    venueAddressLabel.translatesAutoresizingMaskIntoConstraints = false
    venueAddressLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant: 10).isActive = true
    venueAddressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
    venueAddressLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
    venueAddressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
  }

private func setupReviewTextField(){
    addSubview(reviewTextView)
    reviewTextView.translatesAutoresizingMaskIntoConstraints = false
    reviewTextView.topAnchor.constraint(equalTo: venueAddressLabel.bottomAnchor, constant: 10).isActive = true
    reviewTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    reviewTextView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25).isActive = true
    reviewTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  private func setupDeleteButton(){
    addSubview(deleteButton)
    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    deleteButton.topAnchor.constraint(equalTo: venueAddressLabel.bottomAnchor, constant:10).isActive = true
    deleteButton.leadingAnchor.constraint(equalTo: reviewTextView.trailingAnchor).isActive = true
    deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    deleteButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
    deleteButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.15).isActive = true
    deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }

  
}
