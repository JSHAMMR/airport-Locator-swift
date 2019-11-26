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

    override init() {
        
    }
    
    init(locateModel:LocateModel, map:MKMapView) {
        self.locateModel = locateModel
        self.map = map
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
        
        // define region using location
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
        // navigate to that location
        map.setRegion(region, animated: true)
                 
    }
    
    

}
