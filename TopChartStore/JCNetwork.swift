//
//  JCNetwork.swift
//  TopChartStore
//
//  Created by Johann Casique on 11/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

class JCNetwork: NSObject {
    
    public func getData(with endpoint: String, method:HTTPMethod, headers: HTTPHeaders? = ["":""], completionHandler: @escaping (Result<AnyObject>) -> Void){
        
        if method == .get {
            Alamofire.request(URL(string:endpoint)!, method:.get, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
                
                JCNetworkError().handlderError(response: response.response!, completionHandler: { (errorResult) in
                    
                    switch errorResult{
                    case .Success:
                        if let JSON = response.result.value {
                           // completionHandler(.Success(JSON as AnyObject))
                        }
                        break
                    case .ErrorMessage:
                        //completionHandler(.Error(response.result.error!))
                        break
                    }
                })
            }
        }
    }
}
