//
//  File.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

protocol FreeAppConfigurator {
    func configure(freeAppViewController: FreeAppViewController)
}

class FreeAppConfiguratorConfigurator: FreeAppConfigurator {
    
    func configure(freeAppViewController: FreeAppViewController) {
        let apiClient =  ApiClientImplementation(session: SessionManager())
        let apiAppsGateway = ApiAppsGatewayImplemantation(apiClient: apiClient)
        let displayAppsUseCase = TopFreeAppsUseCaseImplementation(appsGateway: apiAppsGateway)
        let router = TopFreeAppsRouterImplementation(freeAppViewController: freeAppViewController)
        
        let presenter = FreeAppPresenterImplementation(view: freeAppViewController,
                                                       displayAppUseCase: displayAppsUseCase,
                                                       router: router)
        freeAppViewController.presenter = presenter
        
    }
}

