//
//  NetworkManager.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/8/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol NetworkManagable {
    func getDetailsForBusiness(withID id: String, completion: @escaping (Result<Business, Error>) -> ())
    func getReviewsForBusiness(withID id: String, completion: @escaping (Result<BusinessReviews, Error>) -> ())
}

struct NetworkManager: NetworkManagable {
    let router: Router<YelpAPI>
    
    func getDetailsForBusiness(withID id: String, completion: @escaping (Result<Business, Error>) -> ()) {
        router.request(.getDetailsForBusiness(withID: id)) { (data, response, error) in
            if let error = error { completion(.failure(error)) }
            else if let data = data, let _ = response {
                do {
                    let business = try JSONDecoder().decode(Business.self, from: data)
                    completion(.success(business))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getReviewsForBusiness(withID id: String, completion: @escaping (Result<BusinessReviews, Error>) -> ()) {
        router.request(.getReviewsForBusiness(withID: id)) { (data, response, error) in
            if let error = error { completion(.failure(error)) }
            else if let data = data, let _ = response {
                do {
                    let businessReviews = try JSONDecoder().decode(BusinessReviews.self, from: data)
                    completion(.success(businessReviews))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
