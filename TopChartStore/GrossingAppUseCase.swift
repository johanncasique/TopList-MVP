//
//  GrossingAppUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

class GrossingAppUseCaseImplementation: TopFreeUseCase {
    
    var gateway: ApiAppsGateway
    
    init(apiAppsGateway: ApiAppsGateway) {
        self.gateway = apiAppsGateway
    }
    
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler) {
        gateway.getApps(withRequest: <#T##ApiRequest#>, completionHanlder: <#T##TopAppsGatewayCompletionHandler##TopAppsGatewayCompletionHandler##(Result<ApiApps>) -> Void#>)
    }
    
    
}
    

