//
//  PlacesProvider.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import MapKit

class PlacesProvider: NSObject,UITableViewDelegate, UITableViewDataSource {
    
    // create google places model
    fileprivate var locateModel:LocateModel!
    fileprivate var map:MKMapView!
    fileprivate var parentView:PlacesView!

    override init() {
        
    }
    
    init(locateModel:LocateModel, map:MKMapView, parentView:PlacesView!) {
        self.locateModel = locateModel
        self.map = map
        self.parentView = parentView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.locateModel != nil
        {
            return self.locateModel.results!.count
            
        } else {
            return 0
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.placesTableViewCell, for: indexPath) as! PlaceTableViewCell
        
        // show only result model from google API
        
        let result =  locateModel.results?[indexPath.row]
        
        // show data on cell labels
        cell.nameLbl.text  = result?.name ?? ""
        cell.latLbl.text    = "Lat : \(result?.geometry?.location?.lat ?? 0.0)"
        cell.longLbl.text   = "Long : \(result?.geometry?.location?.lng ?? 0.0)"
        cell.rateLbl.text   = "Rating : \(result?.rating ?? 0.0)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // result object from locate model
        let result =  locateModel.results?[indexPath.row]
        // define CLLocationCoordinate2D instance
        
        let location = CLLocationCoordinate2D(latitude: result?.geometry?.location?.lat ?? 0.0, longitude: result?.geometry?.location?.lng ?? 0.0)
        
        let cllocation = CLLocation(latitude: location.latitude, longitude: location.longitude)

        // define region using location
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 6000, longitudinalMeters: 6000)
        // navigate to that location
        map.setRegion(region, animated: true)
        
        hidePlacesView()
        
        showAnnotation(title: result?.name ?? "", subtitle: "DISTANCE \(String(format: "%.2f",getDistance(location: cllocation)/1000)) KM", coordinate: location)
                
    }
    
    fileprivate func getDistance(location:CLLocation)  -> Double {
        
       return userLocation.distance(from: location) // result is in meters

    }
    
    fileprivate func showAnnotation(title:String , subtitle:String,coordinate: CLLocationCoordinate2D!) {
        let annotation = MKPointAnnotation()
          annotation.title = title
          annotation.subtitle  = subtitle
          annotation.coordinate = coordinate
          map.addAnnotation(annotation)
         
    }
    
    fileprivate func hidePlacesView () {
        // hide places view with animation
          UIView.transition(with: self.parentView.superview!, duration: 0.5, options: [.transitionCrossDissolve], animations: {
              self.parentView.removeFromSuperview()
                }, completion: nil)
    }

}
