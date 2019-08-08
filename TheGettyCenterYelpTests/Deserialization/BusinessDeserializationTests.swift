//
//  BusinessDeserializationTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/7/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class BusinessDeserializationTests: XCTestCase {
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
    
    func testDeserialization() {
        HelperFunctions.shared.readJSONFromFile(fileName: "GettyCenterBusinessDetailsMock") { (result) in
            switch result {
            case let .success(data):
                do {
                    let business = try self.decoder.decode(Business.self, from: data)
                    XCTAssertNotNil(business)
                    XCTAssertEqual(business.name, "The Getty Center")
                    XCTAssertEqual(business.imageURL, "https://s3-media4.fl.yelpcdn.com/bphoto/XfhEmq_oSF7l1D-j4FciHQ/o.jpg")
                    XCTAssertEqual(business.yelpURL, "https://www.yelp.com/biz/the-getty-center-los-angeles-6?adjust_creative=o3bME_zlxP4Xqr0AVy9eqQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=o3bME_zlxP4Xqr0AVy9eqQ")
                    XCTAssertEqual(business.phoneNumber, "(310) 440-7300")
                    XCTAssertEqual(business.rating, 4.5)
                    XCTAssertEqual(business.photos.count, 3)
                    XCTAssertEqual(business.location, self.location)
                    XCTAssertEqual(business.hours, self.hours)
                } catch {
                    XCTFail("Error : \(error.localizedDescription)")
                }
            case .failure(_):
                XCTFail("Valid path is given. Test shouldn't fail")
            }
        }
    }
}
