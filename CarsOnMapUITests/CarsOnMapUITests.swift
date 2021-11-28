//
//  CarsOnMapUITests.swift
//  CarsOnMapUITests
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import XCTest
import Moya

class when_main_view_is_shown: XCTestCase {

    func test_should_run(){
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        //let requestResource = CarsRequestResource.init(provider: MoyaProvider<CodingTaskAPITarget>(stubClosure: MoyaProvider.immediatelyStub))
        //requestResource.getCarsList { [unowned self] result in
        //    switch result{
        //    case .success(let cars):
        //        print(cars)
        //    case .failure(let error):
        //        print(error)
        //    }
        //}
        
    }
}
