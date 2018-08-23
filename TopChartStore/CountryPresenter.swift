//
//  CountryListPresenter.swift
//  TopChartStore
//
//  Created by Casique, Johan on 20/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol CountryDelegate {
    
}

protocol CountryView: class {
    var dataSource: TableDataSource<CountryTableViewCell, CountryViewModel>? { get set}
    func countryDidSelected(withModel model: CountryViewModel)
}

protocol CountryPresenter {
    func viewDidLoad()
}

class CountryListPresenterImplementation: CountryPresenter, DataSourceDelegate  {
    
    fileprivate weak var view: CountryView?
    internal var router: CountryRouter
    fileprivate var useCase: TopAppsUseCaseProtocol
    
    var countries: [CountryViewModel]?
    
    init(view: CountryView, router: CountryRouter, useCase: TopAppsUseCaseProtocol) {
        self.view = view
        self.router = router
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        
        useCase.getCountries(completionHandler: { [weak self] (countries) in
            guard let strongSelf = self else { return }
            strongSelf.countries = countries
            strongSelf.view?.dataSource = TableDataSource<CountryTableViewCell, CountryViewModel>(array: countries, delegate: self)
        })
    }
    
    func rowDidSelected(at index: Int) {
        
        guard let model = countries?[index] else { return }
        view?.countryDidSelected(withModel: model)
    }
}
