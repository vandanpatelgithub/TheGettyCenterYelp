//
//  BunsinessHoursDeserializationTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/7/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class BunsinessHoursDeserializationTests: XCTestCase {
    
    let decoder = JSONDecoder()
    
    func testDeserialization() {
        HelperFunctions.shared.readJSONFromFile(fileName: "BusinessHoursMockResponse") { (result) in
            switch result {
            case let .success(data):
                do {
                    let businessHours = try self.decoder.decode(BusinessHours.self, from: data)
                    XCTAssertNotNil(businessHours)
                    XCTAssertEqual(businessHours.openingHours.count, 6)
                    XCTAssertEqual(businessHours.openingHours.first?.start, "1000")
                    XCTAssertEqual(businessHours.openingHours.first?.end, "1730")
                    XCTAssertEqual(businessHours.openingHours.first?.day, 1)
                } catch {
                    XCTFail("Error : \(error.localizedDescription)")
                }
            case .failure(_):
                XCTFail("Valid path is given. Test shouldn't fail")
            }
        }
    }
}
