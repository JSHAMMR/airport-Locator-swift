//
//  LocateViewModel.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 25/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import CoreLocation
import GooglePlaces




protocol FetchPlacesDelegate {
    func didFetchPlaces(locateModel:LocateModel)
   }

class LocateViewModel {
    var fetchPlacesDelegate:FetchPlacesDelegate?
    fileprivate let locationManager = CLLocationManager()
    fileprivate var placesClient: GMSPlacesClient!
    
    
    init() {
        locationManager.requestAlwaysAuthorization()
        
        GMSPlacesClient.provideAPIKey(KEY)
        
        placesClient = GMSPlacesClient.shared()

    }

    func fetchPlaces () {
        var strGoogleApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(KEYWORD)&key=\(KEY)"
                  strGoogleApi = strGoogleApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
          
          var urlRequest = URLRequest(url: URL(string: strGoogleApi)!)
          urlRequest.httpMethod = "GET"
          let task = URLSession.shared.dataTask(with: urlRequest) { (data, resopnse, error) in
              if error == nil {
               
                
                
                do {
                    let locateModel  = try! LocateModel(data: data!)

                    self.fetchPlacesDelegate?.didFetchPlaces(locateModel: locateModel)

                } catch let error {
                    print(error)
                }
               
                
                
              } else {
                  //we have error connection google api
              }
          }
          task.resume()
     }
    

}
