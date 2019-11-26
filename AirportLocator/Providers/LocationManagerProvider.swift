//
//  LocationManagerProvider.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationManagerProvider: NSObject,CLLocationManagerDelegate {
    
    fileprivate var map: MKMapView!

    override init() {
        
    }
    init(map:MKMapView) {
     
        self.map = map
        
        // allow to show user location
        self.map.showsUserLocation = true
        
    }
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // allow map to show user location on two status aitherzation (authorizedAlways or authorizedWhenInUse)
        self.map.showsUserLocation = status == .authorizedAlways || status == .authorizedWhenInUse
       }
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
           print("Monitoring failed for region with identifier: \(region!.identifier)")
       }
       
       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print("Location Manager failed with the following error: \(error)")
       }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location Manager failed with the following error: \(locations)")
        
        userLocation = locations.last

    }
}
