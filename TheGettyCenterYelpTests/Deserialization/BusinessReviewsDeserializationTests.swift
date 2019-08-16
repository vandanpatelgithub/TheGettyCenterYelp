//
//  BusinessReviewsDeserializationTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/15/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class BusinessReviewsDeserializationTests: XCTestCase {
    let decoder = JSONDecoder()
    
    func testDeserialization() {
        HelperFunctions.shared.readJSONFromFile(fileName: "TopReviewsMockResponse") { (result) in
            switch result {
            case let .success(data):
                do {
                    let businessReviews = try self.decoder.decode(BusinessReviews.self, from: data)
                    XCTAssertEqual(businessReviews.reviews.count, 3)
                    XCTAssertEqual(businessReviews.reviews.first?.rating, 5)
                    XCTAssertEqual(businessReviews.reviews.first?.timeCreated, "2019-08-10 12:52:01")
                    XCTAssertEqual(businessReviews.reviews.first?.user.name, "Lesie H.")
                } catch {
                    XCTFail("Error : \(error.localizedDescription)")
                }
            case .failure(_):
                XCTFail("Valid path is given. Test shouldn't fail")
            }
        }
    }
}
