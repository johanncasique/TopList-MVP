//
//  CountryListPresenter.swift
//  TopChartStore
//
//  Created by Casique, Johan on 20/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol CountryView {
    var dataSource: TableDataSource<CountryTableViewCell, CountryViewModel> { get set}
}

protocol CountryPresenter {
    
}

class CountryListPresenterImplementation: CountryPresenter  {
    
    var view: CountryView
    var router: CountryRouter
    
    init(view: CountryView, router: CountryRouter) {
        self.view = view
        self.router = router
    }
    
    
    
}
