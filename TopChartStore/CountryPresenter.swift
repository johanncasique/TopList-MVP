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
    func countryDidSelected(withName name: String)
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
        
        countries = useCase.getCountries().map { CountryViewModel(countryDO: $0) }.filter { $0.flag != nil }
        guard let countries = countries else { return }
        view?.dataSource = TableDataSource<CountryTableViewCell, CountryViewModel>(array: countries, delegate: self)
    }
    
    func rowDidSelected(at index: Int) {
        
        guard let model = countries?[index] else { return }
        view?.countryDidSelected(withName: model.code!)
    }
}
