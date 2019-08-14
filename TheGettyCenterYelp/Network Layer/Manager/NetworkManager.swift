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
    func loadImageData(forURL url: String, completion: @escaping (Result<Data, Error>) -> ())
}

struct NetworkManager: NetworkManagable {
    func loadImageData(forURL url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        router.request(.loadImageData(forURL: url)) { (data, response, error) in
            if let error = error { completion(.failure(error)) }
            else if let data = data, let _ = response {
                completion(.success(data))
            }
        }
    }
    
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
}
