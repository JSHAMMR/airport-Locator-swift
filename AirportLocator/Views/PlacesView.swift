//
//  PlacesView.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

class PlacesView: UIView {
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var placesTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
        activityIndicatorView.hidesWhenStopped = true
        // Drawing code
    }
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: ViewID.placesView, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
