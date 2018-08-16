//
//  DetailViewController.swift
//  TopChartStore
//
//  Created by Casique, Johan on 13/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

protocol DetailAppViewProtocol: class {
    //var dataSource: DataSource<FreeAppTableViewCell, DetailAppPresenter> { set get }
    
}

class DetailViewController: UIViewController, DetailAppViewProtocol {
    
    var presenter: DetailAppPresenterProtocol?
    var configurator: DetailAppConfigProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator?.configure(detailViewController: self)
        presenter?.viewDidLoad()
        
    }
    
    
    
}
