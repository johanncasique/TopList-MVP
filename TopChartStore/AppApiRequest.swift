//
//  AppApiRequest.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

struct AppsApiRequest: ApiRequest {
    
    let country: String
    
    var url: String {
        return "\(AppleURL)\(country)/\(Query.FreeApp)"
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
