//
//  BaseViewController.swift
//  TopChartStore
//
//  Created by Casique, Johan on 21/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

enum BarButtonsConfig {
    case country
    case search
    case closeCountries
}


class BaseViewController: UIViewController {
    
    func configBarButton(_ config: BarButtonsConfig) {
        
        switch config {
        case .country:
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: #selector(loadCountryFunc))
        case .search:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: #selector(searchAppFunc))
        case .closeCountries:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Close-1"), style: .plain, target: self, action: #selector(closeCountryView))
        }
    }
    
    @objc func loadCountryFunc() { }
    
    @objc func searchAppFunc() { }
    
    @objc func closeCountryView() { }
}
