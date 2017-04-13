//
//  SurveyController.swift
//  Survey
//
//  Created by Gavin Olsen on 4/13/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import Foundation

class SurveyController {
    
    //baseURL
    
    static let baseURL = URL(string: "https://survey-999e2.firebaseio.com/survey")
    
    //fetch
    
    static func fetchResponses(completion: @escaping (_ responses: [Survey]) -> Void) {
        
        guard let url = baseURL?.appendingPathExtension("json") else { fatalError("bad url") }
        
        NetworkController.performRequest(url: url, httpMethod: .get) { (data, error) in
            
            var surveys: [Survey] = []
            
            defer { completion(surveys) }
            
            guard let data = data else { fatalError("bad data") }
            let responseDataString = String(data: data, encoding: .utf8)
            
            
            guard error == nil else { return }
            guard !(responseDataString?.contains("error"))! else {print("error: \(String(describing: responseDataString))"); return}
            guard let jsonDict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: [String: Any]] else { return }
                surveys = jsonDict.flatMap { Survey(dictionary: $0.1, id: $0.0)}
        }
    }
    
    //post
    
    
    
    
}
