//
//  GrossingAppPresenter.swift
//  TopChartStore
//
//  Created by johann casique on 17/06/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol GrossingAppView: class {
    func refreshView()
}

protocol GrossingAppPresenter {
    var numberOfApps: Int { get }
    var router: GrossingRouter { get }
    func viewDidLoad()
    func configure(cell: FreeAppTableViewCell, forRow row: Int)
    func didSelected(atRow row: Int)
}

class GrossingAppPresenterImplementation: GrossingAppPresenter {
    
    var apps = [App]()
    fileprivate weak var view: GrossingAppView?
    fileprivate let displayUseCase: TopFreeUseCase
    internal let router: GrossingRouter
    
    var numberOfApps: Int {
        return apps.count
    }
    
    init(view: GrossingAppView, useCase: TopFreeUseCase, router: GrossingRouter) {
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
