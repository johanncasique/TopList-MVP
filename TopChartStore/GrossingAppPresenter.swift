//
//  GrossingAppPresenter.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol GrossingAppView: class {
    var dataSource: TableDataSource<FreeAppTableViewCell, FreeAppTableViewCellViewModel>? { get set }
}

protocol GrossingAppPresenter {
    var numberOfApps: Int { get }
    var router: GrossingRouter { get }
    func viewDidLoad()
}

class GrossingAppPresenterImplementation: GrossingAppPresenter, DataSourceDelegate {
    
    var items: [App]?
    fileprivate weak var view: GrossingAppView?
    fileprivate let displayUseCase: TopAppsUseCaseProtocol
    internal let router: GrossingRouter
    
    var numberOfApps: Int {
        return items?.count ?? 0
    }
    
    init(view: GrossingAppView, useCase: TopAppsUseCaseProtocol, router: GrossingRouter) {
        self.view = view
        self.displayUseCase = useCase
        self.router = router
    }
    
    
    func viewDidLoad() {
        displayUseCase.getApps {apps in
            switch apps {
            case .success(let apps):
                self.handleApps(apps)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func rowDidSelected(at index: Int) {
        guard let items = items else { return }
        router.goToDetail(app: items[index])
    }
    
    // MARK: - Privates
    private func handleApps(_ apps: ApiApps) {
        guard let app = apps.result else { return }
        self.items = app
        let models = self.items!.map { FreeAppTableViewCellViewModel(model: $0) }
        
        view?.dataSource = TableDataSource<FreeAppTableViewCell, FreeAppTableViewCellViewModel>(array: models, delegate: self)
    }
}
