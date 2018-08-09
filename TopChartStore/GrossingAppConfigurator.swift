//
//  GrossingAppConfigurator.swift
//  TopChartStore
//
//  Created by johann on 25/07/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

protocol GrossingAppConfigurator {
    func configure(view: GrossingAppViewController, country: String)
}

class GrossingAppConfiguratorImplementation: GrossingAppConfigurator {
    
    func configure(view: GrossingAppViewController, country: String) {
        let apiClient = ApiClientImplementation(session: SessionManager())
        let apiGateway = ApiAppsGatewayImplemantation(apiClient: apiClient)
        let useCase = GrossingAppUseCaseImplementation(apiAppsGateway: apiGateway, country: country)
        let router = GrossingAppRouterImplementation(grossingViewController: view)
        let presenter =  GrossingAppPresenterImplementation(view: view,
                                                           useCase: useCase,
                                                           router: router)
        view.presenter = presenter
        
    }
}


//let apiClient = ApiClientImplementation(session: SessionManager())
//let apiAppGateway = ApiAppsGatewayImplemantation(apiClient: apiClient)
//let useCase = PaidAppUseCaseImplementation(appsGateway: apiAppGateway, country: country)
//let router = PaidAppRouterImplementation(paidAppViewController: paidAppViewController)
//
//let presenter = PaidAppPresenterImplementation(view: paidAppViewController,
//                                               useCase: useCase,
//                                               router: router)
//paidAppViewController.presenter = presenter
