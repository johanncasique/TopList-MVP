//
//  UseCaseProtocol.swift
//  TopChartStore
//
//  Created by Casique, Johan on 09/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol TopAppsUseCaseProtocol {
    func getApps(completionHandler: @escaping TopAppsGatewayCompletionHandler)
    func getCountries(completionHandler: @escaping (_ viewModel: [CountryViewModel]) -> Void)
}

protocol TopAppsUseCaseImplementationProtocol: TopAppsUseCaseProtocol {
    var appsGateway: ApiAppsGateway { get }
    var country: String { get }
}

protocol RatingUseCaseProtocol {
    func getRating(completionHandler: @escaping RatingCompletionHandler)
}

protocol RatingUseCaseProtocolImplementation: RatingUseCaseProtocol {
    var ratingGateway: RatingGateway { get }
    var idApp: String { get }
}
