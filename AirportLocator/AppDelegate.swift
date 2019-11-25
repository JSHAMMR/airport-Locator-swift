//
//  AppDelegate.swift
//  AirportLocator
//
//  Created by Gamil Ali Qaid Shamar on 25/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSPlacesClient.provideAPIKey("AIzaSyD9jtCRDexMo9VShzsiVzwYliA-XlgLOD4")

        return true
    }

    

}

