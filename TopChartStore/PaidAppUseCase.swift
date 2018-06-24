//
//  PadiAppUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 16/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias PaidAppGatewayCompletion = (_ apps: Result<ApiApps>) -> Void

protocol PadiAppUseCase {
    func getApps(completion: @escaping PaidAppGatewayCompletion)
}

class PaidAppUseCaseImplementation: PadiAppUseCase {
    let appsGateway: ApiAppsGateway
    
    init(appsGateway: ApiAppsGateway) {
        self.appsGateway = appsGateway
    }
    
    func getApps(completion: @escaping PaidAppGatewayCompletion) {
        self.appsGateway.getApps { apps in
            completion(apps)
        }
    }
}
