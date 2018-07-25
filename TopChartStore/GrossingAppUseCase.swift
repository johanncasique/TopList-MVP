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
    let country: String
    
    init(apiAppsGateway: ApiAppsGateway, country: String) {
        self.gateway = apiAppsGateway
        self.country = country
    }
    
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler) {
        gateway.getApps(withRequest: GrossingApiRequest(country: country), completionHanlder: { apps in
            completionHandler(apps)
        })
    }
    
    
}
    

