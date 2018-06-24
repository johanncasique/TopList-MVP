//
//  PadApiRequest.swift
//  TopChartStore
//
//  Created by johann casique on 16/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

struct PadApiRequest: ApiRequest {
    var url: String {
        return "\(AppleURL)ve/\(Query.paidApp)"
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
