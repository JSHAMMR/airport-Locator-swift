//
//  PlacesDelegateDataSourceTest.swift
//  AirportLocatorTests
//
//  Created by Gamil Ali Qaid Shamar on 27/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import XCTest
import MapKit
@testable import Airport_Locator

class PlacesDelegateDatasourceMock: PlacesProviderProtocol {
    
    var didSelectCell: Bool = false
    var result: Result?
    
    func didSelectCell(result : Result) {
        
        print("PlacesProviderProtocol :\(result)")

        didSelectCell = true
        self.result = result
    }
}

class PlacesDelegateDataSourceTest: XCTestCase {
    fileprivate var locateModel:LocateModel!
    fileprivate var locateViewModel:LocateViewModel!
    fileprivate let testDelegate = PlacesDelegateDatasourceMock()

    
    fileprivate var placesProvider: PlacesProvider!
    fileprivate var tableView: UITableView!
          
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locateViewModel = LocateViewModel()
        locateModel = locateViewModel.loadMockData() // mock data contains 20 models
        
        
        
        // feed tested tableview by mock provider
        placesProvider = PlacesProvider(locateModel: locateModel)
        tableView = UITableView()


        tableView.register(PlaceTableViewCell.self,
                           forCellReuseIdentifier: CellID.placesTableViewCell)
        tableView.dataSource = placesProvider
        tableView.delegate = placesProvider
        placesProvider.placesProviderProtocol = testDelegate
        
            
    }
    
    
    func testRowCount () {
        // we already knew it's 20 rows
        XCTAssertEqual(placesProvider.tableView(tableView, numberOfRowsInSection: 0), 20)
    }
    
    func testSectionCount () {
           // we already knew it's 1 section
       XCTAssertEqual(placesProvider.numberOfSections(in: tableView), 1)
   }
    
    func testUserSelection () {
        let indexPath = IndexPath(row: 0, section: 0)

        XCTAssertFalse(testDelegate.didSelectCell)
        
        let indexPath2 = IndexPath(row: 1, section: 0)

        XCTAssertFalse(testDelegate.didSelectCell)
        
        placesProvider.tableView(tableView, didSelectRowAt: indexPath2)
        XCTAssertTrue(testDelegate.didSelectCell)
        
        XCTAssertEqual(testDelegate.result?.name, "Kuala Lumpur International Airport Terminal 2")

        

    }
    

    
    func testDistance()  {
        
        
        let cllocation1 = CLLocation(latitude: 3.1157063, longitude: 101.6390933)
        let cllocation2 = CLLocation(latitude: 2.7455962, longitude: 101.7071602)
        // mock distance 41619.46524668598

        
        print(placesProvider.getDistance(location1: cllocation1, location2: cllocation2))
        XCTAssertEqual(placesProvider.getDistance(location1: cllocation1, location2: cllocation2), 41619.46524668598)
        
        
    }
    
    


  
}
