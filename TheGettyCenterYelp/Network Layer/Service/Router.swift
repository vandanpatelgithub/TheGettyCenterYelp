//
//  Router.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/8/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, nil)
        }
        self.task?.resume()
    }
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        switch route.task {
        case .request:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .requestHeaders(let additionHeaders):
            self.addAdditionHeaders(additionHeaders, request: &request)
        }
        return request
    }
    
    private func addAdditionHeaders(_ additionHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
