//
//  UtilitiesTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/7/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class UtilitiesTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testGetTwelveHourString1() {
        var inputString = "1000"
        guard let outputString = inputString.getTwelveHourString() else {
            XCTFail("String to 24-hour date conversion failed")
            return
        }
        XCTAssertEqual(outputString, "10:00 AM")
    }
    
    func testGetTwelveHourString2() {
        var inputString = "1730"
        guard let outputString = inputString.getTwelveHourString() else {
            XCTFail("String to 24-hour date conversion failed")
            return
        }
        XCTAssertEqual(outputString, "5:30 PM")
    }
    
    func testGetTwelveHourString3() {
        var inputString = "2100"
        guard let outputString = inputString.getTwelveHourString() else {
            XCTFail("String to 24-hour date conversion failed")
            return
        }
        XCTAssertEqual(outputString, "9:00 PM")
    }
    
    func testDayOfTheWeekInitializer1() {
        let day = DayOfTheWeek(day: 0)
        XCTAssertEqual(day, DayOfTheWeek.monday)
    }
    
    func testDayOfTheWeekInitializer2() {
        let day = DayOfTheWeek(day: 1)
        XCTAssertEqual(day, DayOfTheWeek.tuesday)
    }
    
    func testDayOfTheWeekInitializer3() {
        let day = DayOfTheWeek(day: 2)
        XCTAssertEqual(day, DayOfTheWeek.wednesday)
    }
    
    func testDayOfTheWeekInitializer4() {
        let day = DayOfTheWeek(day: 3)
        XCTAssertEqual(day, DayOfTheWeek.thursday)
    }
    
    func testDayOfTheWeekInitializer5() {
        let day = DayOfTheWeek(day: 4)
        XCTAssertEqual(day, DayOfTheWeek.friday)
    }
    
    func testDayOfTheWeekInitializer6() {
        let day = DayOfTheWeek(day: 5)
        XCTAssertEqual(day, DayOfTheWeek.saturday)
    }
    
    func testDayOfTheWeekInitializer7() {
        let day = DayOfTheWeek(day: 6)
        XCTAssertEqual(day, DayOfTheWeek.sunday)
    }
}
