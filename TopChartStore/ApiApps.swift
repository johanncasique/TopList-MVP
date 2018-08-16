//
//  ApiApps.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

struct ApiApps: InitializableWithData {
    
    let result: [App]?
    
    init(data: Data?) throws {
        guard let data = data else { throw NSError.createParseError() }
        let jsonObject = try? JSONDecoder().decode(TopApps.self, from: data)
        
        result = jsonObject?.feed?.results
    }
}
