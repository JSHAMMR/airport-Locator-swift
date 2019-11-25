//
//  ViewController.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 25/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    var placesClient: GMSPlacesClient!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()

        // Do any additional setup after loading the view.
    }

    @IBAction func getCurrentPlace(_ sender: UIButton) {

       placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
         if let error = error {
           print("Current Place error: \(error.localizedDescription)")
           return
         }

         self.nameLabel.text = "No current place"
         self.addressLabel.text = ""

         if let placeLikelihoodList = placeLikelihoodList {
           let place = placeLikelihoodList.likelihoods.first?.place
           if let place = place {
             self.nameLabel.text = place.name
             self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
               .joined(separator: "\n")
           }
         }
       })
     }
}

