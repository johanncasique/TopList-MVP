//
//  RatingRequest.swift
//  TopChartStore
//
//  Created by Casique, Johan on 06/09/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

struct RatingRequest: ApiRequest {
    
    let idApp: String
    
    var url: String {
        return "\(DetailAppleURL)\(Query.rating)\(idApp)"
    }
    
    var method: ApiHTTPMethod {
        return .get
    }
    
    
    
}
