//
//  TopFreeAppsRouter.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

protocol TopFreeAppsRouter {
    func showDetail(for app: App)
    func showCountryList()
}

class TopFreeAppsRouterImplementation: TopFreeAppsRouter {
    fileprivate var freeAppViewController: FreeAppViewController?
    fileprivate var app: App?
    
    init(freeAppViewController: FreeAppViewController) {
        self.freeAppViewController = freeAppViewController
        
    }
    
    func showDetail(for app: App) {
        self.app = app
        
        let VC: DetailViewController = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        VC.configurator = DetailAppConfiguratorImplementation(app)
        
        guard let navigator = freeAppViewController?.navigationController else {
            print("Navigation controller is not in stack view")
            return
        }
        navigator.pushViewController(VC, animated: true)
    }
    
    func showCountryList() {
        let countryVC: CountryListViewController = UIStoryboard.storyboard(storyboard: .CountryListViewController).instantiateViewController()
        countryVC.delegate = freeAppViewController?.presenter
        freeAppViewController?.present(countryVC, animated: true)
    }
}
