//
//  FreeAppPresenter.swift
//  TopChartStore
//
//  Created by johann casique on 22/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol FreeAppView: class {
    var dataSource: DataSource<FreeAppTableViewCell>? { get set }
    func refreshAppView()
    func displayBooksRetrievalError(title: String, message: String)
}

protocol FreeAppPresenter {
    var numberOfApps: Int { get }
    var router: TopFreeAppsRouter { get }
    func viewDidLoad()
    func configure(cell: FreeAppTableViewCell, forRow row: Int)
    func didSelect(row: Int)
}

class FreeAppPresenterImplementation: FreeAppPresenter {
    fileprivate weak var view: FreeAppView?
    fileprivate let displayAppUseCase: TopAppsUseCaseProtocol
    internal let router: TopFreeAppsRouter
    
    var apps = [App]()
    
    var numberOfApps: Int {
        return apps.count
    }
    
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
    
    func configure(cell: FreeAppTableViewCell, forRow row: Int) {
        let app = apps[row]
        
        cell.configureFreeCell(with: app)
    }
    
    func didSelect(row: Int) {
        
    }
    
    //=================================
    // MARK: - Handle apps
    //=================================
    fileprivate func handleApps(_ apps: ApiApps) {
        guard let app = apps.result else { return }
        self.apps = app
        let data = DataSource<FreeAppTableViewCell>()
        data.items = app
        view?.dataSource = data
        //view?.refreshAppView()
    }
    
    fileprivate func handleAppsError(_ error: Error) {
        view?.displayBooksRetrievalError(title: "Error", message: error.localizedDescription)
    }
}
