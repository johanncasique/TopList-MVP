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
    let country: String
    
    init(appsGateway: ApiAppsGateway, country: String) {
        self.appsGateway = appsGateway
        self.country = country
    }
    
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler) {
        self.appsGateway.getApps(withRequest: AppsApiRequest(country: country)) { (apps) in
            completionHandler(apps)
        }
    }
}
