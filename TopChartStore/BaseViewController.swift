//
//  BaseViewController.swift
//  TopChartStore
//
//  Created by Casique, Johan on 21/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func configBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icSideMenu"), style: .plain, target: self, action: #selector(loadCountryFunc))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: #selector(searchAppFunc))
    }
    
    @objc func loadCountryFunc() { }
    
    @objc func searchAppFunc() { }
    
    
}
