//
//  TopFreeAppsRouter.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol TopFreeAppsRouter {
    func showDetail(for app: App)
}

class TopFreeAppsRouterImplementation: TopFreeAppsRouter {
    fileprivate weak var freeAppViewController: FreeAppViewController?
    fileprivate var app: App?
    
    init(freeAppViewController: FreeAppViewController) {
        self.freeAppViewController = freeAppViewController
        
    }
    
    func showDetail(for app: App) {
        self.app = app
    }
    
}
