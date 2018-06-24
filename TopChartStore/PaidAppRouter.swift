//
//  PaidAppRouter.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol PaidAppRouter {
    func goToDetail(for app: App)
}

class PaidAppRouterImplementation: PaidAppRouter {

    fileprivate weak var paidAppViewController: PaidAppsViewController?
    fileprivate var app: App?
    
    
    init(paidAppViewController: PaidAppsViewController) {
        self.paidAppViewController = paidAppViewController
    }

    func goToDetail(for app: App) {
        self.app = app
    }
}
