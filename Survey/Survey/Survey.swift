//
//  Survey.swift
//  Survey
//
//  Created by Gavin Olsen on 4/13/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import Foundation

class Survey {
    
    let name: String
    let lang: String
    let id: UUID
    
    init(name: String, lang: String, id: UUID = UUID()) {
        
        self.name = name
        self.lang = lang
        self.id = id
    }
    
}

//MARK: - JSON

extension Survey {
    
    private static var namekey: String { return "name" }
    private static var langkey: String { return "language" }
    
    convenience init?(dictionary: [String:Any], id: String) {
        
        guard let name = dictionary[Survey.namekey] as? String, let language = dictionary[Survey.langkey] as? String, let id = UUID(uuidString: id) else {return nil}
        
        self.init(name: name, lang: language, id: id)
    }
 
    var jsonDict: [String: Any] {
        let jsonDict: [String:Any] = [Survey.namekey: name, Survey.langkey: lang]
        return jsonDict
    }
    
    var jsonRep: Data? {
        return try? JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
    }
}
