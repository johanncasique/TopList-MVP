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
    var router: TopFreeAppsRouter { get }
    func viewDidLoad()
    func didSelect(row: Int)
}

class CountryListPresenterImplementation: CountryPresenter  {
    
    fileprivate weak var view: CountryView
    internal var router: CountryRouter
    fileprivate var useCase: TopAppsUseCaseProtocol
    
    var countries: [CountryDO]?
    
    
//    fileprivate weak var view: FreeAppView?
//    fileprivate let displayAppUseCase: TopAppsUseCaseProtocol
//    internal let router: TopFreeAppsRouter
    
    init(view: CountryView, router: CountryRouter, useCase: TopAppsUseCaseProtocol) {
        self.view = view
        self.router = router
        self.useCase
    }
    
    func viewDidLoad() {
        
        countries = useCase.getCountry(for: "ve")
        
    }
}
