//
//  PadiAppUseCase.swift
//  TopChartStore
//
//  Created by johann casique on 16/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

class PaidAppUseCaseImplementation: TopAppsUseCaseImplementationProtocol {
    let appsGateway: ApiAppsGateway
    let country: String
    
    init(appsGateway: ApiAppsGateway, country: String) {
        self.appsGateway = appsGateway
        self.country = country
    }
    
    func getApps(completionHandler completion: @escaping TopAppsGatewayCompletionHandler) {
        appsGateway.getApps(withRequest: PadApiRequest(country: country)) { apps in
            completion(apps)
        }
    }
}
