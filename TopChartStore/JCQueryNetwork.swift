//
//  JCQueryNetwork.swift
//  TopChartStore
//
//  Created by Johann Casique on 31/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

//let AppleURL = "https://itunes.apple.com/"
let AppleURL = "https://rss.itunes.apple.com/api/v1/"

enum Query: String {
    //case FreeApp = "/rss/topfreeapplications/limit=100/json"
    static let FreeApp = "ios-apps/top-free/all/200/explicit.json"
    case paidApp = "/ios-apps/top-paid/all/200/explicit.json"
    case grossingApp = "/ios-apps/top-grossing/all/200/explicit.json"
    
}

class JCQueryNetwork {
    
    enum Result<Q> {
        case Success(Q)
        case Error(String)
    }
    
    public func getApps(_ store: Query,  country: String, completionHandler: @escaping (Result<AnyObject>) -> Void){
        
        let endpoint = "\(AppleURL)\(country)\(store.rawValue)"
        
        JCNetwork().getData(with: endpoint, method: .get) { (freeAppResponse) in
            
//            switch freeAppResponse{
//            case .Success(let data):
//                let dataDic = data as! NSDictionary
//                completionHandler(.Success(dataDic))
//                break
//            case .Error(let err):
//                completionHandler(.Error("Error"))
//                print(err)
//                break
//            }
        }
    }
}

