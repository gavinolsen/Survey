//
//  NetworkController.swift
//  Survey
//
//  Created by Gavin Olsen on 4/13/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import Foundation

class NetworkController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    static func performRequest(url: URL, httpMethod: HTTPMethod, urlParams: [String:String], body: Data? = nil, completion: ((Data?, Error?) -> Void)? = nil) {
        
        let urlRequest = self.url(byAdding: urlParams, to: url)
        
        var request = URLRequest(url: urlRequest)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            completion?(data, error)
        })
        
        dataTask.resume()
        
    }
    
    static func url(byAdding params: [String:String]?, to url: URL) -> URL {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = params?.flatMap({ URLQueryItem(name: $0.0, value: $0.1)})
        
        guard let url = components?.url else { fatalError("url optinal is nil")}
        return url
    }
    
}
