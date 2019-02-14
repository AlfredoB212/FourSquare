//
//  VenuesViewController.swift
//  FourSquareProject1
//
//  Created by J on 2/12/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class VenuesViewController: UIViewController {
    private lazy var venuesView = VenueCollection()
    private var venues = SavingManager.loadingEntry()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        view.addSubview(venuesView)
    }
  
  private func setupDelegates(){
    venuesView.venueCollection.delegate = self
    venuesView.venueCollection.dataSource = self
  }

}

extension VenuesViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = venuesView.venueCollection.dequeueReusableCell(withReuseIdentifier: "VenueCell", for: indexPath) as? VenueCell else { fatalError("") }
    cell.configureCell()
    cell.deleteButton.tag = indexPath.row
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return venues.count
  }
}

extension VenuesViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
      / 3)
  }
}
