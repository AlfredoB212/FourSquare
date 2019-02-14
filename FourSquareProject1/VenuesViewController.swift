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
  private var venues = [SaveModel]() {
    didSet {
      venuesView.venueCollection.reloadData()
    }
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    fetchVenues()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDelegates()
    SavingManager.savingEntry()
    view.addSubview(venuesView)
  }
  
  private func setupDelegates(){
    venuesView.venueCollection.delegate = self
    venuesView.venueCollection.dataSource = self
  }
  
  private func fetchVenues() {
    venues = SavingManager.loadingEntry()
  }
  
  @objc private func deleteVenue(sender:UIButton){
    let deleteIndex = sender.tag
    SavingManager.removing(index: deleteIndex)
    fetchVenues()
  }
  
  
}

extension VenuesViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = venuesView.venueCollection.dequeueReusableCell(withReuseIdentifier: "VenueCell", for: indexPath) as? VenueCell else { fatalError("") }
    let venue = venues[indexPath.row]
    cell.configureCell(venue:venue,selector: #selector(deleteVenue(sender:)), target: self)
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
      / 2.5)
  }
}
