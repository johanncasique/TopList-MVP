//
//  CountryRouter.swift
//  TopChartStore
//
//  Created by Casique, Johan on 20/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol CountryRouter {
    func countryDidSelected()
}

class CountryRouterImplemetation: CountryRouter {
    var countryViewController: CountryListViewController?
    
    init(countryViewController: CountryListViewController) {
        self.countryViewController = countryViewController
    }
    
    func countryDidSelected() {
        
    }
}
