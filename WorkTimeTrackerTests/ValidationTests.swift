//
//  ValidationTests.swift
//  WorkTimeTrackerTests
//
//  Created by Dilyana Yankova on 13.01.20.
//  Copyright © 2020 Dilyana Yankova. All rights reserved.
//

import XCTest
@testable import WorkTimeTracker

class ValidationTests: XCTestCase {

    var validation: Validation!
    
    override func setUp() {
        validation = Validation()
    }

    override func tearDown() {
       validation = nil
    }

    func testValidatеNameWhenValid(){
        let name = "ValidNameOfProject"
        let result = validation.validateName(name)
        XCTAssertTrue(result)
    }
    
    func testValidateNameTooShort(){
        let name = "w"
        let result = validation.validateName(name)
        XCTAssertFalse(result)
   }
    
    func testValidateNameTooSLong(){
        let name = "NameConsistingTooManyCharacters"
        let result = validation.validateName(name)
        XCTAssertFalse(result)
   }
    
    func testValidateNameEmpty(){
         let name = ""
         let result = validation.validateName(name)
         XCTAssertFalse(result)
    }
    
    func testValidateNameWhiteSpace(){
        let name = " Name with space"
        let result = validation.validateName(name)
        XCTAssertTrue(result)
       }
    
    func testValidateHoursInvalid(){
        let hoursString = "text"
        let result = validation.validateHours(hoursString)
        XCTAssertFalse(result)
    }
    
    func testValidateHoursValid(){
        let hours = "1.5"
        let result = validation.validateHours(hours)
        XCTAssertTrue(result)
    }
    
    func testValidateHoursEmpty(){
        let hours = ""
        let result = validation.validateHours(hours)
        XCTAssertFalse(result)
    }
    
    func testValidateDateValid(){
        let date = "2019/07/27"
        let result = validation.validateDate(date)
        XCTAssertTrue(result)
    }
    
    func testValidateDateDifferentFormat(){
        let date = "2019-07-27"
        let result = validation.validateDate(date)
        XCTAssertTrue(result)
    }
    
    func testValidateDateNotValid(){
        let date = "2019 -07-ss27"
        let result = validation.validateDate(date)
        XCTAssertFalse(result)
    }
  
    func testValidateHoursInADayValid(){
        let hoursString = "24"
        let result = validation.validateHoursInADay(hoursString)
        XCTAssertTrue(result)
    }
    
    func testValidateHoursInADayNotValid(){
        let hoursString = "25"
        let result = validation.validateHoursInADay(hoursString)
        XCTAssertFalse(result)
    }
}
