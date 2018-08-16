//
//  GrossingAppImplementation.swift
//  TopChartStore
//
//  Created by johann on 25/07/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol GrossingRouter {
    func goToDetail(app: App)
}

class GrossingAppRouterImplementation: GrossingRouter {
    
    fileprivate weak var grossingViewController: GrossingAppViewController?
    fileprivate var app: App?
    
    init(grossingViewController: GrossingAppViewController) {
        self.grossingViewController = grossingViewController
    }
    
    func goToDetail(app: App) {
        self.app = app
    }
}
