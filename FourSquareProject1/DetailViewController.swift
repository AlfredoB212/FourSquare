//
//  ViewController.swift
//  FourSquareProject1
//
//  Created by Alfredo Barragan on 2/8/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailViewSetup = DetailViewSetup()
    var venue: Venues?
    var location: String!
    var picimage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Post"
        view.addSubview(detailViewSetup)
        let rightBarItem = UIBarButtonItem(customView: detailViewSetup.saveButton)
        self.navigationItem.rightBarButtonItem = rightBarItem
        detailLooksSetUp()
        
    }
    
    private func detailLooksSetUp(){
        detailViewSetup.address.text = "Address:" + " \(venue?.location.formattedAddress?[0] ?? "") \(venue?.location.formattedAddress?[1] ?? "No Address")"
        detailViewSetup.saveButton.addTarget(self, action: #selector(saveCommand), for: .touchUpInside)
        detailViewSetup.nameOfLocation.text = "Name of place: \(venue?.name ?? "No Name")"
        detailViewSetup.direction.setTitle("Direction", for: .normal)
        detailViewSetup.direction.addTarget(self, action: #selector(direction), for: .touchUpInside)
        
        PhotoAPIClient.getPhoto(venueId: venue!.id) { (error, data) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.errorMessage())
                } else if let data = data {
                    let prefix = data[0].prefix
                    let suffix = data[0].suffix
                    let urlString = prefix + "original" + suffix
                    self.picimage = urlString
                    self.detailViewSetup.picture.image = ImageHelper.fetchImageFromCache(urlString: urlString)
        
                }
    
            }
        }
    }
    
    @objc func direction(){
        let directionVC = DirectionViewController()
        directionVC.venue = venue
        navigationController?.pushViewController(directionVC, animated: true)
    }

    @objc func saveCommand(){
        if venue?.location.formattedAddress?.first != nil  && venue?.location.formattedAddress?[1] != nil {
   location = (venue?.location.formattedAddress?[0])! + " " + (venue?.location.formattedAddress?[1])!
        }else{
            location = "No Location"
        }
    
            if detailViewSetup.tip.text.isEmpty {
                let alert = UIAlertController(title: "Missing Tip", message: "Tip needs to be field out to save this venue", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                present(alert, animated: true, completion: nil)
        }
        let savemodel = SaveModel.init(picImage: picimage, name: venue?.name ?? "No Name", address: location, latitude: Float(venue?.location.lat ?? 0.0), longitude: Float(venue?.location.lng ?? 0.0), review: "")
        print(savemodel)
        
        SavingManager.appening(type: savemodel)
    }
    
}


