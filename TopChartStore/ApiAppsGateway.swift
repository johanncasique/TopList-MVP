//
//  ApiAppsGateway.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias TopAppsGatewayCompletionHandler = (_ apps: Result<ApiApps>) -> Void

protocol ApiAppsGateway {
    func getApps(withRequest request: ApiRequest, completionHanlder: @escaping TopAppsGatewayCompletionHandler)
    func getCountries() -> [CountryDO]
}

class ApiAppsGatewayImplemantation: ApiAppsGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getApps(withRequest request: ApiRequest, completionHanlder: @escaping TopAppsGatewayCompletionHandler) {
        
        apiClient.execute(request: request) { (result: Result<ApiResponse<ApiApps>>) in
            switch result {
            case let .success(response):
                print(response)
                completionHanlder(.success(response.entity))
            case let .failure(error):
                completionHanlder(.failure(error))
            }
        }
    }
    
    func getCountries() -> [CountryDO] {
        
        var countries = [CountryDO]()
        
        for country in NSLocale.isoCountryCodes {
            
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: country])
            let name = NSLocale(localeIdentifier: "es_ES").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(country)"
            
            let dto = Country(code: country, name: name)
            countries.append(CountryDO(dto: dto))

        }
        return countries
    }
}
