//
//  MapProvider.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import MapKit

class MapProvider: NSObject, MKMapViewDelegate {
    private let reuseIdentifier = "placePin"
    override init() {
           
       }
    
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    
}
