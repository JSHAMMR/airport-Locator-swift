//
//  ModelMapingTest.swift
//  AirportLocatorTests
//
//  Created by Gamil Ali Qaid Shamar on 27/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import XCTest
@testable import Airport_Locator

class ModelMapingTest: XCTestCase {
    fileprivate var locateModel:LocateModel!

    
    func getMockItem () -> Data{
        
        var tempData : Data!

        
        
              let testBundle = Bundle(for: type(of: self))
            let path = testBundle.path(forResource: "item", ofType: "json")
                 do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
                    
            
                    tempData =  data
                  
             
                   } catch let error{
                      print("error\(error)")
                        // handle error
                   }
             
          
        
        return tempData
                             
         }
    
    
    override func setUp() {
        do {
            locateModel = try LocateModel(data: self.getMockItem())// mock data contains 20 models
        } catch let error {
            print(error)
        }
        
              
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

   
    
    func testMapping () {
        
        let result = locateModel.results?.first
        
        XCTAssertEqual(result?.name, "Kuala Lumpur International Airport")
        XCTAssertEqual(result?.id, "170dd6b481e63891981754cc8b509ddf9adebe8a")
        XCTAssertEqual(result?.rating, 4.1)


        
    }

}
