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
    var router: PaidAppRouter { get }
    func viewDidLoad()
    func configure(cell: FreeAppTableViewCell, forRow row: Int)
    func didSelected(atRow row: Int)
}

class GrossingAppPresenterImplementation: GrossingAppPresenter {

    
    var apps = [App]()
    var router: PaidAppRouter
    fileprivate weak var view: GrossingAppView?
    
    var numberOfApps: Int {
        return apps.count
    }
    
    
    init(<#parameters#>) {
        <#statements#>
    }
    
    
    func viewDidLoad() {
        
    }
    
    func configure(cell: FreeAppTableViewCell, forRow row: Int) {
        cell.configureFreeCell(with: apps[row])
    }
    
    func didSelected(atRow row: Int) {
        
    }
    
    
}
