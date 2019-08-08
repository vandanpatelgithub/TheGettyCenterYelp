//
//  BusinessLocationDeserializationTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/7/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class BusinessLocationDeserializationTests: XCTestCase {
    let decoder = JSONDecoder()
    
    func testDeserialization() {
        HelperFunctions.shared.readJSONFromFile(fileName: "BusinessLocationMockResponse") { (result) in
            switch result {
            case let .success(data):
                do {
                    let businessLocation = try self.decoder.decode(BusinessLocation.self, from: data)
                    XCTAssertNotNil(businessLocation)
                    XCTAssertEqual(businessLocation.address1, "1200 Getty Center Dr")
                    XCTAssertEqual(businessLocation.address2, "")
                    XCTAssertEqual(businessLocation.address3, "")
                    XCTAssertEqual(businessLocation.city, "Los Angeles")
                    XCTAssertEqual(businessLocation.zipcode, "90049")
                    XCTAssertEqual(businessLocation.country, "US")
                    XCTAssertEqual(businessLocation.state, "CA")
                    
                } catch {
                    XCTFail("Error : \(error.localizedDescription)")
                }
            case .failure(_):
                XCTFail("Valid path is given. Test shouldn't fail")
            }
        }
    }
}
