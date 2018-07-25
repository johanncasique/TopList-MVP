//
//  GrossingApiRequest.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire


struct GrossingApiRequest: ApiRequest {
    
    let country: String
    
    var url: String {
        return "\(AppleURL)\(country)/\(Query.grossingApp)"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
