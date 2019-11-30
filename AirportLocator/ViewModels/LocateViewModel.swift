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
    // create delegation func to be used on controller
    func didFetchPlaces(locateModel:LocateModel)
   }

class LocateViewModel {
    // create delegation instance
    var fetchPlacesDelegate:FetchPlacesDelegate?
    // create google places instance
    fileprivate var placesClient: GMSPlacesClient!
    
    
    init() {
        // provide a key from google console api
        GMSPlacesClient.provideAPIKey(KEY)
        
        placesClient = GMSPlacesClient.shared()

    }
    
     func loadMockData () -> LocateModel{
        var locateModel:LocateModel!

           if let path = Bundle.main.path(forResource: "mockData", ofType: "json") {
               
               do {
                       let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                       locateModel = try JSONDecoder().decode(LocateModel.self, from: data)
                
                print(locateModel)
           
                 } catch let error{
                    print("error\(error)")
                      // handle error
                 }
           }
        
        return locateModel
                           
       }
    
    
    
    
    func getGooglePlaces(completion: @escaping (LocateModel) -> Void) {
        
        var strGoogleApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(KEYWORD)&key=\(KEY)"
           strGoogleApi = strGoogleApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

           var urlRequest = URLRequest(url: URL(string: strGoogleApi)!)
           urlRequest.httpMethod = "GET"
           let task = URLSession.shared.dataTask(with: urlRequest) { (data, resopnse, error) in
               if error == nil {
                 do {
                     
                     // decode response data to LocateModel
                     let locateModel  = try! LocateModel(data: data!)

                     // set locateModel to clousre
                    completion(locateModel)

                 } catch let error {
                     print(error)
                 }
               } else {
                   //we have error connection google api
               }
           }
           task.resume()
        
        
    }

    
    // function to excute a query of nearby airports
    func fetchPlaces () {
        
        // call google api function and set delegate value
        self.getGooglePlaces { (locateModel) in
            self.fetchPlacesDelegate?.didFetchPlaces(locateModel: locateModel)

        }
     }
    

}
