//
//  ViewController.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 25/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var placesProvider: PlacesProvider!
    @IBOutlet var locationManagerProvider: LocationManagerProvider!
    var placesView:PlacesView!
    fileprivate let locateViewModel = LocateViewModel()
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    @IBOutlet var mapProvider: MapProvider!
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
        // define locationManagerProvider
        locationManagerProvider = LocationManagerProvider(map:self.map)
        
        // define locationManager features
        locationManager.delegate = locationManagerProvider
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 1
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // map
        self.mapProvider = MapProvider()
        
        self.map.delegate = self.mapProvider
        
        
    }
    
    @IBAction func locate(_ sender: Any) {
        map.zoom()
        
    }
    @IBAction func showPlaces(_ sender: Any) {
        if self.placesView == nil {
                  // load views

              self.placesView = (PlacesView.instanceFromNib() as! PlacesView)
              self.placesView.frame = CGRect(x: 20, y: 200, width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height-400)
                  
              
              // register cell
              self.placesView.placesTableView.register(UINib(nibName: CellID.placesTableViewCell, bundle: nil), forCellReuseIdentifier: CellID.placesTableViewCell)
              }
        
        // start loading
        self.placesView.activityIndicatorView.startAnimating()
        
        // cell view model to fetch places and set liseneer
        locateViewModel.fetchPlaces()
        locateViewModel.fetchPlacesDelegate = self
        
        // show tableview with animation
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            self.view.addSubview(self.placesView)
            self.placesView.closeButton.addTarget(self, action: #selector(self.close), for: .touchUpInside)

        }, completion: nil)
    }
    
    @objc func close(){
        // remove tableview with animation

       UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
         self.placesView.removeFromSuperview()
       }, completion: nil)
    }
       
    
}

extension ViewController:FetchPlacesDelegate {
    func didFetchPlaces(locateModel: LocateModel) {
        // once fetching is done this delegation func will be called
        
        // feed the provider with reposnse model from google places API
        self.placesProvider = PlacesProvider(locateModel: locateModel,map: self.map , parentView: self.placesView)
        
        // using main thread for UI update
        DispatchQueue.main.async {
            
            // start loading animation
            self.placesView.activityIndicatorView.stopAnimating()
            // reload tableview data
            self.placesView.placesTableView.reloadData()
            // set the protocols to provider 
            self.placesView.placesTableView.delegate = self.placesProvider
            self.placesView.placesTableView.dataSource = self.placesProvider
          
        }
         locateModel.results?.forEach({
            
            guard let name = $0.name else {return}
            
            print(name)
            
        })
    }
}


