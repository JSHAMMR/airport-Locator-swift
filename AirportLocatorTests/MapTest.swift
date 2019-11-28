//
//  MapTest.swift
//  AirportLocatorTests
//
//  Created by Gamil Ali Qaid Shamar on 28/11/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import XCTest
import MapKit
@testable import Airport_Locator
fileprivate var viewController : ViewController!

class MapTest: XCTestCase {
    
    

    override func setUp() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))

        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController

       if(viewController != nil) {

           viewController.loadView()
           viewController.viewDidLoad()
       }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }


    func testViewControllerIsComposedOfMapView() {

        XCTAssertNotNil(viewController.map, "ViewController under test is not composed of a MKMapView")
      }
    
    
    func testMapViewDelegateIsSet() {
       
           XCTAssertNotNil(viewController.map.delegate)
       }
    
    
    func testControllerCanAddAnnotationToMapView() {
        viewController.map.addAnnotation(MKPointAnnotation())
        let mapHasAnno = self.hasTargetAnnotation(annotationClass: MKPointAnnotation.self)
        XCTAssertTrue(mapHasAnno)
    }

      
    func hasTargetAnnotation(annotationClass: MKAnnotation.Type) -> Bool {
        
        let mapAnnotations = viewController.map.annotations
        
        var hasTargetAnnotation = false
        for anno in mapAnnotations {
            if (anno.isKind(of: annotationClass)) {
                hasTargetAnnotation = true
            }
        }
        
        return hasTargetAnnotation
    }
    
    
    func testControllerAddsAnnotationsToMapView() {
          viewController.map.addAnnotation(MKPointAnnotation())

        let annotationsOnMap = viewController.map.annotations
          XCTAssertGreaterThan(annotationsOnMap.count, 0)
      }

}
