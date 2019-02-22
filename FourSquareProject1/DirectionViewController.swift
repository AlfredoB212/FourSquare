//
//  DirectionViewController.swift
//  FourSquareProject1
//
//  Created by Jason on 2/19/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DirectionViewController: UIViewController {
    
    var directionView = DirectionView()
    let request = MKDirections.Request()

    var annotations = [MKAnnotation](){
        didSet{
            
        }
    }
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation!{
        didSet{
            self.makeAnnotationsForDirection()
        }
    }
    var venue: Venues?
    var directionLocation = [CLLocationCoordinate2D]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(directionView)
        updateTheUIInfo()
   
    }
    
    func updateTheUIInfo() {
        directionLocation.removeAll()
        annotations.removeAll()
        directionCLManager()
        locationManager.delegate = self
        directionLocation.append(venue!.coordinate)
        directionView.directionMap.delegate = self
    }

    func directionCLManager() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func makeAnnotationsForDirection() {
        directionView.directionMap.removeAnnotations(annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = venue!.coordinate
        annotation.title = venue!.name
        annotations.append(annotation)
        directionView.directionMap.addAnnotations(annotations)
        
    }
    func direction(location: [CLLocationCoordinate2D]) -> MKDirections.Request {
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: directionLocation[0], addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: directionLocation[1], addressDictionary: nil))
        request.requestsAlternateRoutes = false
        request.transportType = .walking
        return request
    }
    
    func directionTrailCalling(request: MKDirections.Request){
        let direction = MKDirections(request: request)
        direction.calculate { (directions, error) in
          guard let directionFinallyGotten = directions else {return print(error)}
          for location in directionFinallyGotten.routes {
              self.directionView.directionMap.addOverlay(location.polyline)
              self.directionView.directionMap.setVisibleMapRect(location.polyline.boundingMapRect, animated: true)
          }
      }
        
    }
}

extension DirectionViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("no locations found")
            return
        }
        currentLocation = location
        let myRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters:500, longitudinalMeters: 500)
        directionView.directionMap.setRegion(myRegion, animated: true)
        let newAnnotaion = MKPointAnnotation()
        newAnnotaion.coordinate = currentLocation.coordinate
        newAnnotaion.title = "Current Location"
        annotations.append(newAnnotaion)
        directionLocation.append(newAnnotaion.coordinate)
        makeAnnotationsForDirection()
        directionTrailCalling(request: direction(location: directionLocation))

    }
    
}

extension DirectionViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let trail = MKPolylineRenderer(overlay: overlay)
        trail.strokeColor = UIColor.blue
        trail.fillColor = UIColor.red
        trail.lineWidth = 2
        return trail
    }
}
