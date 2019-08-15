//
//  NetworkManagerMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

enum MockError: Error {
    case invalidID
}

let mockBusiness = Business(name: "mockName",
                            imageURL: "mockImageURL",
                            yelpURL: "mockYelpURL",
                            phoneNumber: "mockPhoneNumber",
                            rating: 3.0,
                            location: BusinessLocation(address1: "mockAddress1",
                                                       address2: "mockAddress2",
                                                       address3: "mockAddress3",
                                                       city: "mockCity",
                                                       zipcode: "mockZipCode",
                                                       state: "mockState",
                                                       country: "mockCountry"),
                            photos: [],
                            hours: [],
                            totalReviews: 3000)

class NetworkManagerMock: NetworkManagable {
    func getDetailsForBusiness(withID id: String, completion: @escaping (Result<Business, Error>) -> ()) {
        if id.isEmpty {
            completion(.failure(MockError.invalidID))
        } else {
            completion(.success(mockBusiness))
        }
    }
}
