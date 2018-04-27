//
//  AppsGateway.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias FetchAppsEntityGatewayCompletionHandler = (_ books: Result<[App]>) -> Void

protocol AppsGateway {
    func fetchApps(completionHandler: @escaping FetchAppsEntityGatewayCompletionHandler)
}
