//
//  PlacesProvider.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import MapKit

protocol PlacesProviderProtocol {
    func didSelectCell(result: Result)
}

class PlacesProvider: NSObject,UITableViewDelegate, UITableViewDataSource {
    
    // create google places model
    fileprivate var locateModel:LocateModel!
    fileprivate var map:MKMapView!
    var parentView:PlacesView!
    var placesProviderProtocol: PlacesProviderProtocol?

    override init() {
        
    }
    
    init(locateModel:LocateModel) { // for test
        self.locateModel = locateModel
    }
    
    init(locateModel:LocateModel, map:MKMapView, parentView:PlacesView!) {// for coding
        self.locateModel = locateModel
        self.map = map
        self.parentView = parentView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
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
        let cllocation = CLLocation(latitude:  result!.geometry?.location?.lat ?? 0.0, longitude: result!.geometry?.location?.lng ?? 0.0)

        // show data on cell labels
        cell.nameLbl.text  = result?.name ?? ""
        cell.latLbl.text    = "Lat : \(result?.geometry?.location?.lat ?? 0.0)"
        cell.longLbl.text   = "Long : \(result?.geometry?.location?.lng ?? 0.0)"
        cell.rateLbl.text   = "\(String(format: "%.2f",getDistance(location1:userLocation,location2: cllocation)/1000)) KM"

        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // result object from locate model
        guard let result =  locateModel.results?[indexPath.row] else {
            return
        }
        placesProviderProtocol?.didSelectCell(result: result) // for testing

        let location = CLLocationCoordinate2D(latitude: result.geometry?.location?.lat ?? 0.0, longitude: result.geometry?.location?.lng ?? 0.0)
        
        let cllocation = CLLocation(latitude: location.latitude, longitude: location.longitude)

        // define region using location
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 6000, longitudinalMeters: 6000)
        // navigate to that location
        
        if map != nil {
            map.setRegion(region, animated: true)

        }

        if self.parentView != nil {
            hidePlacesView(view: self.parentView)

        }
        

        if userLocation != nil {
            showAnnotation(title: result.name ?? "", subtitle: "DISTANCE \(String(format: "%.2f",getDistance(location1:userLocation,location2: cllocation)/1000)) KM", coordinate: location)
                
        }
                
    }
    
    
    
    func getDistance(location1:CLLocation,location2:CLLocation)  -> Double {
        
       return location1.distance(from: location2) // result is in meters

    }
    
     func showAnnotation(title:String , subtitle:String,coordinate: CLLocationCoordinate2D!) {
        let annotation = MKPointAnnotation()
          annotation.title = title
          annotation.subtitle  = subtitle
          annotation.coordinate = coordinate
          map.addAnnotation(annotation)
         
    }
    
     func hidePlacesView (view:UIView) -> Bool {
        
            // hide places view with animation
            UIView.transition(with:view.superview!, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                view.removeFromSuperview()
                  }, completion: nil)
            
            
            return true
        
        

        
    }

}
