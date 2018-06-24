//
//  TopFreeUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 20/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol TopFreeUseCase {
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler)
}

class TopFreeAppsUseCaseImplementation: TopFreeUseCase {
    
    let appsGateway: ApiAppsGateway
    
    init(appsGateway: ApiAppsGateway) {
        self.appsGateway = appsGateway
    }
    
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler) {
        self.appsGateway.getApps(withRequest: AppsApiRequest()) { (apps) in
            completionHandler(apps)
        }
    }
}
