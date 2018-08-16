//
//  AppsGateway.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

typealias FetchAppsEntityGatewayCompletionHandler<T> = (_ books: Result<[T]>) -> Void

protocol AppsGateway {
    func fetchApps<T>(completionHandler: @escaping FetchAppsEntityGatewayCompletionHandler<T>)
}
