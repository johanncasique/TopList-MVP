//
//  DetailAppConfigurator.swift
//  TopChartStore
//
//  Created by Casique, Johan on 13/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

protocol DetailAppConfigProtocol{
    func configure(detailViewController: DetailViewController)
}

class DetailAppConfiguratorImplementation: DetailAppConfigProtocol {
    
    let appDetail: App
    var view: DetailViewController
    
    init(_ appDetail: App) {
        self.appDetail = appDetail
        self.view = DetailViewController()
    }
    
    func configure(detailViewController: DetailViewController) {
        
        let presenter = DetailAppPresenter(view: detailViewController, app: appDetail)
        detailViewController.presenter = presenter
         
    }
    
    
}
