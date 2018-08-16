//
//  DetailAppPresenter.swift
//  TopChartStore
//
//  Created by Casique, Johan on 13/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol DetailAppPresenterProtocol {
    
    func viewDidLoad()
}

class DetailAppPresenter: DetailAppPresenterProtocol {
    
    fileprivate let detailAppViewProtocol: DetailAppViewProtocol
    let appDetail: App
    
    init(view: DetailAppViewProtocol, app: App) {
        self.detailAppViewProtocol = view
        self.appDetail = app
    }
    
    
    func viewDidLoad() {
       print(appDetail)
    }
}
