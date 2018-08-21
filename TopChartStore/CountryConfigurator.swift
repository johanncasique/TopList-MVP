//
//  CountryConfigurator.swift
//  TopChartStore
//
//  Created by Casique, Johan on 21/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol CountryConfigurator {
    associatedtype T
    func configure(viewController: T)
}

class CountryConfiguratorImplementation: CountryConfigurator, ApiSession {

    
    
    func configure(viewController: CountryListViewController) {
        let apiClient = ApiClientImplementation(session: defaultSession)
        let apiAppsGateway = ApiAppsGatewayImplemantation(apiClient: apiClient)
        let displayAppUseCase = TopFreeAppsUseCaseImplementation(appsGateway: apiAppsGateway, country: "")
        
        let router = CountryRouterImplemetation(countryViewController: viewController)
        
        let presenter = CountryListPresenterImplementation(view: viewController, router: router, useCase: displayAppUseCase)
        
        viewController.presenter = presenter
    }
    
}
