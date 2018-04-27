//
//  TopFreeUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 20/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias TopFreeAppsGatewayCompletionHandler = (_ apps: Result<ApiApps>) -> Void

protocol TopFreeUseCase {
    func getApps(completionHandler: @escaping TopFreeAppsGatewayCompletionHandler)
}

class TopFreeAppsUseCaseImplementation: TopFreeUseCase {
    
    let appsGateway: ApiAppsGateway
    
    init(appsGateway: ApiAppsGateway) {
        self.appsGateway = appsGateway
    }
    
    func getApps(completionHandler: @escaping TopFreeAppsGatewayCompletionHandler) {
        self.appsGateway.getApps { (apps) in
            completionHandler(apps)
        }
    }
}
