//
//  HelperFunctions.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/7/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

enum ReadJSONError: Error {
    case invalidURL
}

class HelperFunctions {
    
    private init() {}
    static let shared = HelperFunctions()
    
    func readJSONFromFile(fileName: String, completion: @escaping (Result<Data, Error>) ->()) {
        let testBundle = Bundle(for: HelperFunctions.self)
        guard let url = testBundle.url(forResource: fileName, withExtension: "json"), !fileName.isEmpty else {
            completion(.failure(ReadJSONError.invalidURL))
            return
        }
        
        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
}
