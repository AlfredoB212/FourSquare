//
//  VenueCollection.swift
//  FourSquareProject1
//
//  Created by J on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class VenueCollection: UIView {
    public lazy var venueCollection: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      let cv = UICollectionView(frame:UIScreen.main.bounds, collectionViewLayout:layout)
      cv.register(VenueCell.self, forCellWithReuseIdentifier: "VenueCell")
      cv.backgroundColor = .white
      return cv
    }()

    override init(frame: CGRect) {
      super.init(frame: UIScreen.main.bounds)
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
    setupVenueCollection()
  }

  private func setupVenueCollection(){
      addSubview(venueCollection)
      venueCollection.translatesAutoresizingMaskIntoConstraints = false
      venueCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
      venueCollection.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
      venueCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
