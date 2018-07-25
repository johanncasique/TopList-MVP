//
//  PaidAppConfigurator.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

protocol PaidAppConfigurator {
    func configure(paidAppViewController: PaidAppsViewController, country: String)
}

class PaidAppConfiguratorImplementation: PaidAppConfigurator {
    
    func configure(paidAppViewController: PaidAppsViewController, country: String) {
        let apiClient = ApiClientImplementation(session: SessionManager())
        let apiAppGateway = ApiAppsGatewayImplemantation(apiClient: apiClient)
        let useCase = PaidAppUseCaseImplementation(appsGateway: apiAppGateway, country: country)
        let router = PaidAppRouterImplementation(paidAppViewController: paidAppViewController)
        
        let presenter = PaidAppPresenterImplementation(view: paidAppViewController,
                                                       useCase: useCase,
                                                       router: router)
        paidAppViewController.presenter = presenter
    }
}
