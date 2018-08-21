//
//  GrossingAppUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

class GrossingAppUseCaseImplementation: TopAppsUseCaseImplementationProtocol {
    
    var appsGateway: ApiAppsGateway
    var country: String
    
    init(apiAppsGateway: ApiAppsGateway, country: String) {
        self.appsGateway = apiAppsGateway
        self.country = country
    }
    
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler) {
        appsGateway.getApps(withRequest: GrossingApiRequest(country: country), completionHanlder: { apps in
            completionHandler(apps)
        })
    }
    
    func getCountries() -> [CountryDO] {
        return appsGateway.getCountries()
    }
    
    
        
    
}
