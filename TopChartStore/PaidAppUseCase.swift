//
//  PadiAppUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 16/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol PaidAppUseCase {
    func getApps(completion: @escaping TopAppsGatewayCompletionHandler)
}

class PaidAppUseCaseImplementation: PaidAppUseCase {
    let appsGateway: ApiAppsGateway
    
    init(appsGateway: ApiAppsGateway) {
        self.appsGateway = appsGateway
    }
    
    func getApps(completion: @escaping TopAppsGatewayCompletionHandler) {
        self.appsGateway.getApps(withRequest: PadApiRequest()) { apps in
            completion(apps)
        }
    }
}
