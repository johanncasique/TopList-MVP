//
//  ApiAppsGateway.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias TopAppsGatewayCompletionHandler = (_ apps: Result<ApiApps>) -> Void

protocol ApiAppsGateway {
    func getApps(withRequest request: ApiRequest, completionHanlder: @escaping TopAppsGatewayCompletionHandler)
}

class ApiAppsGatewayImplemantation: ApiAppsGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getApps(withRequest request: ApiRequest, completionHanlder: @escaping TopAppsGatewayCompletionHandler) {
        
        apiClient.execute(request: request) { (result: Result<ApiResponse<ApiApps>>) in
            switch result {
            case let .success(response):
                print(response)
                completionHanlder(.success(response.entity))
            case let .failure(error):
                completionHanlder(.failure(error))
            }
        }
    }
    
    
}
