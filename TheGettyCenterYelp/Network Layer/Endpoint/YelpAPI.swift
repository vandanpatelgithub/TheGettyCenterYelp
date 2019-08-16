//
//  YelpAPI.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/8/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

enum YelpAPIConstants: String {
    case authorization = "Authorization"
    case bearer = "Bearer"
    case apiKey = "HLtKEMfXNdIRsMsg-aM-C6CndyBpSWWFVNMDocl6zMbfo9AFDtR9zgzG6k_69S9BBll20axZmudy5lRqO1Pu82-VNebepFJ5EsFQPc1pStV4uute7zPd9xI8iuZIXXYx"
}

public enum YelpAPI {
    case getDetailsForBusiness(withID: String)
    case getReviewsForBusiness(withID: String)
}

extension YelpAPI: EndPointType {
    var baseURL: URL {
        switch self {
        case .getDetailsForBusiness, .getReviewsForBusiness:
            guard let url = URL(string: "https://api.yelp.com/v3") else {
                fatalError("baseURL could not be configured.")
            }
            return url
        }
    }
    
    var path: String {
        switch self {
        case let .getDetailsForBusiness(ID):
            return "businesses/\(ID)"
        case let .getReviewsForBusiness(ID):
            return "businesses/\(ID)/reviews"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .getDetailsForBusiness, .getReviewsForBusiness:
            return .requestHeaders(additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getDetailsForBusiness, .getReviewsForBusiness:
            return [YelpAPIConstants.authorization.rawValue: "\(YelpAPIConstants.bearer.rawValue) \(YelpAPIConstants.apiKey.rawValue)"]
        }
    }
}
