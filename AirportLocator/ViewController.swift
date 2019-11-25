//
//  ViewController.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 25/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    fileprivate let locateViewModel = LocateViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locateViewModel.fetchPlaces()
        locateViewModel.fetchPlacesDelegate = self
        // Do any additional setup after loading the view.
    }
       
    
}


extension ViewController:FetchPlacesDelegate {
    func didFetchPlaces(locateModel: LocateModel) {
        locateModel.results?.forEach({
            
            guard let name = $0.name else {return}
            
            print(name)
            
        })
        
    }
    
  
}
