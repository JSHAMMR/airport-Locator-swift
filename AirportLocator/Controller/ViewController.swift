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

    @IBOutlet var placesProvider: PlacesProvider!
    
    fileprivate var placesView:PlacesView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placesView = (PlacesView.instanceFromNib() as! PlacesView)
        self.placesView.frame = CGRect(x: 20, y: 200, width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height-400)
        
        
        self.placesView.placesTableView.register(UINib(nibName: CellID.placesTableViewCell, bundle: nil), forCellReuseIdentifier: CellID.placesTableViewCell)

           
        
       
        
    }
    @IBAction func showPlaces(_ sender: Any) {
        self.placesView.activityIndicatorView.startAnimating()
        locateViewModel.fetchPlaces()
        locateViewModel.fetchPlacesDelegate = self
               
               

        
        UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            self.view.addSubview(self.placesView)
            self.placesView.closeButton.addTarget(self, action: #selector(self.close), for: .touchUpInside)

        }, completion: nil)
    }
    
    @objc fileprivate func close(){
       UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
         self.placesView.removeFromSuperview()
       }, completion: nil)
    }
       
    
}


extension ViewController:FetchPlacesDelegate {
    func didFetchPlaces(locateModel: LocateModel) {
        
        
        self.placesProvider = PlacesProvider(locateModel: locateModel)
        DispatchQueue.main.async {
            self.placesView.activityIndicatorView.stopAnimating()
            self.placesView.placesTableView.reloadData()
            self.placesView.placesTableView.delegate = self.placesProvider
            self.placesView.placesTableView.dataSource = self.placesProvider
          
        }
         locateModel.results?.forEach({
            
            guard let name = $0.name else {return}
            
            print(name)
            
        })
        
    }
    
  
}
