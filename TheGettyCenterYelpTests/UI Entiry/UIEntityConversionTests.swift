//
//  UIEntityConversionTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class UIEntityConversionTests: XCTestCase {
    let decoder = JSONDecoder()
    let location = BusinessLocation(address1: "1200 Getty Center Dr",
                                    address2: "",
                                    address3: "",
                                    city: "Los Angeles",
                                    zipcode: "90049",
                                    state: "CA",
                                    country: "US")
    
    let hours = [
        BusinessHours(openingHours: [
            OpeningHours(start: "1000", end: "1730", day: 1),
            OpeningHours(start: "1000", end: "1730", day: 2),
            OpeningHours(start: "1000", end: "1730", day: 3),
            OpeningHours(start: "1000", end: "1730", day: 4),
            OpeningHours(start: "1000", end: "2100", day: 5),
            OpeningHours(start: "1000", end: "1730", day: 6)
            ])
    ]
    
    func testConvertToUIModel() {
        HelperFunctions.shared.readJSONFromFile(fileName: "GettyCenterBusinessDetailsMock") { (result) in
            switch result {
            case let .success(data):
                do {
                    let business = try self.decoder.decode(Business.self, from: data)
                    let uiModel = business.convertToUIModel()
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours.first?.start, "10:00 AM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours.first?.end, "5:30 PM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours.first?.day.rawValue, "Tuesday")
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours[1].start, "10:00 AM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[1].end, "5:30 PM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[1].day.rawValue, "Wednesday")
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours[2].start, "10:00 AM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[2].end, "5:30 PM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[2].day.rawValue, "Thursday")
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours[3].start, "10:00 AM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[3].end, "5:30 PM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[3].day.rawValue, "Friday")
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours[4].start, "10:00 AM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[4].end, "9:00 PM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[4].day.rawValue, "Saturday")
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours[5].start, "10:00 AM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[5].end, "5:30 PM")
                    XCTAssertEqual(uiModel.hours.first?.openingHours[5].day.rawValue, "Sunday")
                    
                    XCTAssertEqual(uiModel.location, business.location)
                    XCTAssertEqual(uiModel.name, business.name)
                    XCTAssertEqual(uiModel.imageURL, business.imageURL)
                    XCTAssertEqual(uiModel.yelpURL, business.yelpURL)
                    XCTAssertEqual(uiModel.phoneNumber, business.phoneNumber)
                    XCTAssertEqual(uiModel.rating, business.rating)
                    XCTAssertEqual(uiModel.photos, business.photos)
                } catch {
                    XCTFail("Error : \(error.localizedDescription)")
                }
            case .failure(_):
                XCTFail("Valid path is given. Test shouldn't fail")
            }
        }
    }
}
