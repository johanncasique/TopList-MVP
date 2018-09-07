//
//  RatingGateway.swift
//  TopChartStore
//
//  Created by Casique, Johan on 06/09/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias RatingCompletionHandler = (_ rating: Result<RatingDO>) -> Void

protocol RatingGateway {
    func getRating(withRequest request: ApiRequest, completion: @escaping RatingCompletionHandler)
}

class RatingGatewayImplementation: RatingGateway {
    
    let apiClient: ApiClient
    
    init(client: ApiClient) {
        self.apiClient = client
    }
    
    func getRating(withRequest request: ApiRequest, completion: @escaping RatingCompletionHandler) {
        
        apiClient.execute(request: request) { (response: Result<ApiResponse<RatingDO>>) in
            
            switch response {
            case .success(let rating):
                completion(.success(rating.entity))
            case.failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
