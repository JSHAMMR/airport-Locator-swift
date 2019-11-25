//
//  PlacesProvider.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit



class PlacesProvider: NSObject,UITableViewDelegate, UITableViewDataSource {
    
    
    fileprivate var locateModel:LocateModel!
    override init() {
        
    }
    
    init(locateModel:LocateModel) {
        self.locateModel = locateModel
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
        
        let result =  locateModel.results?[indexPath.row]
        
        
        
        
        cell.nameLbl.text  = result?.name ?? ""
        cell.latLbl.text    = "\(result?.geometry?.location?.lat ?? 0.0)"
        cell.longLbl.text   = "\(result?.geometry?.location?.lat ?? 0.0)"
        cell.rateLbl.text   = "\(result?.rating ?? 0.0)"

        
        

        return cell
    }
    
    

}
