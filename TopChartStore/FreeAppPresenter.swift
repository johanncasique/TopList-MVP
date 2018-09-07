//
//  FreeAppPresenter.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol FreeAppView: class {
    var dataSource: TableDataSource<FreeAppTableViewCell, FreeAppTableViewCellViewModel>? { get set }
    var countryName: String { get set }
    func loadData(_ countryName: String)
    func displayBooksRetrievalError(title: String, message: String)
}

protocol FreeAppPresenter: CountryListViewControllerDelegate {
    func viewDidLoad()
    func loadCountry()
    func didSelect(row: Int)
}

class FreeAppPresenterImplementation: FreeAppPresenter, DataSourceDelegate {
    fileprivate weak var view: FreeAppView?
    fileprivate let displayAppUseCase: TopAppsUseCaseProtocol
    internal let router: TopFreeAppsRouter
    
    var items: [App]?
    
    init(view: FreeAppView, displayAppUseCase: TopAppsUseCaseProtocol, router: TopFreeAppsRouter) {
        self.view = view
        self.displayAppUseCase = displayAppUseCase
        self.router = router
    }
    
    func viewDidLoad() {
        self.displayAppUseCase.getApps { (result) in
            switch result {
            case let .success(apps):
                self.handleApps(apps)
            case let .failure(error):
                self.handleAppsError(error)
            }
        }
    }
    
    func didSelect(row: Int) {
        
    }
    
    // MARK: - Handle apps
    fileprivate func handleApps(_ apps: ApiApps) {
        guard let app = apps.result else { return }
        self.items = app
        var modelArr = [FreeAppTableViewCellViewModel]()
        for model in items! {
            let viewModel = FreeAppTableViewCellViewModel(model: model)
            modelArr.append(viewModel)
        }
        let dataSource = TableDataSource<FreeAppTableViewCell, FreeAppTableViewCellViewModel>(array: modelArr, delegate: self)
        view?.dataSource = dataSource
    }
    
    fileprivate func handleAppsError(_ error: Error) {
        view?.displayBooksRetrievalError(title: "Error", message: error.localizedDescription)
    }
    
    func rowDidSelected(at index: Int) {
        guard let items = items else { return }
        router.showDetail(for: items[index])
    }
    
    func loadCountry() {
        router.showCountryList()
    }
}

extension FreeAppPresenterImplementation: CountryListViewControllerDelegate {
    func countryDidSelected(withModel model: CountryViewModel) {
        guard let countryCode = model.code, let name = model.name else { return }
        view?.countryName = name
        view?.loadData(countryCode)
    }
}
