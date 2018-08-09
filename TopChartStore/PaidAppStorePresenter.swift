//
//  PaidAppStorePresenter.swift
//  TopChartStore
//
//  Created by johann casique on 16/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol PaidAppView: class {
    func refreshView()
}

protocol PaidAppPresenter {
    var numberOfApps: Int { get }
    var router: PaidAppRouter { get }
    func viewDidLoad()
    func configure(cell: FreeAppTableViewCell, forRow row: Int)
    func didSelected(atRow row: Int)
}

class PaidAppPresenterImplementation: PaidAppPresenter {
    
    fileprivate weak var view: PaidAppView?
    fileprivate let displayAppUseCase: TopAppsUseCaseProtocol
    internal let router: PaidAppRouter
    
    var apps = [App]()
    var numberOfApps: Int {
        return apps.count
    }
    
    init(view: PaidAppView, useCase: TopAppsUseCaseProtocol, router: PaidAppRouter) {
        self.view = view
        self.displayAppUseCase = useCase
        self.router = router
    }
    
    func viewDidLoad() {
        displayAppUseCase.getApps { result in
            switch result {
            case let .success(apps):
                self.handleApps(apps)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func configure(cell: FreeAppTableViewCell, forRow row: Int) {
        cell.configureFreeCell(with: apps[row])
    }
    
    func didSelected(atRow row: Int) {
        
    }
    
    //=================================
    // MARK: - Privates
    //=================================
    private func handleApps(_ apps: ApiApps) {
        guard let app = apps.result else { return }
        self.apps = app
        view?.refreshView()
    }
    
}
