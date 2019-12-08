//
//  AirportLocatorTests.swift
//  AirportLocatorTests
//
//  Created by Gamil Ali Qaid Shamar on 26/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import XCTest
import CoreLocation

@testable import Airport_Locator
class LocationManagerTests: XCTestCase {


    fileprivate var viewContoller = ViewController()

    
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    func testLocationManager() {
          XCTAssertNotNil(viewContoller.locationManager)
      }
    
    
    func testLocationManagerServicesEnabled() {
          
          XCTAssertTrue(CLLocationManager.locationServicesEnabled())
      }
    

//    func testLocationManagerAuthorizationStatusAlways() {
//
//        XCTAssertEqual(CLLocationManager.authorizationStatus(), .authorizedAlways)
//    }
    
//    func testLocationManagerAuthorizationStatusWhenInUse() { // in case of authorization when in use
//
//        XCTAssertEqual(CLLocationManager.authorizationStatus(), .authorizedWhenInUse)
//    }


}
