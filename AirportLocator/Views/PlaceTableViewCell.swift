//
//  PlaceTableViewCell.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var latLbl:UILabel!
    @IBOutlet weak var longLbl:UILabel!
    @IBOutlet weak var distanceLbl:UILabel!

    var result : Result! {
          didSet {
                nameLbl.text  = result?.name ?? ""
                latLbl.text    = "Lat : \(result?.geometry?.location?.lat ?? 0.0)"
                longLbl.text   = "Long : \(result?.geometry?.location?.lng ?? 0.0)"
          }
      }
}
