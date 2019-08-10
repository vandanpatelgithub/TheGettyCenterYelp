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
    
    let tuesday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "1730", day: 1))
    let wednesday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "1730", day: 2))
    let thursday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "1730", day: 3))
    let friday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "1730", day: 4))
    let saturday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "2100", day: 5))
    let sunday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "1730", day: 6))
    let monday = OpeningHoursUIModel(hours: OpeningHours(start: "1000", end: "1730", day: 0))
    
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
                    
                    XCTAssertEqual(uiModel.hours.first?.openingHours.count, 6)
                    XCTAssertTrue(uiModel.hours.first?.openingHours.contains(self.tuesday) ?? false)
                    XCTAssertTrue(uiModel.hours.first?.openingHours.contains(self.wednesday) ?? false)
                    XCTAssertTrue(uiModel.hours.first?.openingHours.contains(self.thursday) ?? false)
                    XCTAssertTrue(uiModel.hours.first?.openingHours.contains(self.friday) ?? false)
                    XCTAssertTrue(uiModel.hours.first?.openingHours.contains(self.saturday) ?? false)
                    XCTAssertTrue(uiModel.hours.first?.openingHours.contains(self.sunday) ?? false)
                    XCTAssertFalse(uiModel.hours.first?.openingHours.contains(self.monday) ?? false)
                    
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
