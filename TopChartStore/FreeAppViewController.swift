//
//  ViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 10/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

typealias Country = String

class FreeAppViewController: UIViewController, FreeAppView, TabBarConfigurationProtocol {
    
    //MARK:Variables and Iboutlets
    @IBOutlet weak var freeTable: UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var presenter: FreeAppPresenter!
    lazy var configurator: FreeAppConfiguratorConfigurator = {
        return FreeAppConfiguratorConfigurator()
    }()
    private let defaults = UserDefaults.standard
    var dataSource: TableDataSource<FreeAppTableViewCell, App>? {
        didSet {
            DispatchQueue.main.async { [weak self] in 
                guard let strongSelf = self else { return }
                strongSelf.freeTable.dataSource = strongSelf.dataSource
                strongSelf.freeTable.delegate = strongSelf.dataSource
                strongSelf.freeTable.reloadData()
                strongSelf.activity.stopAnimating()
                strongSelf.activity.hidesWhenStopped = true
            }
        }
    }
    
    func displayBooksRetrievalError(title: String, message: String) {
        
    }
    
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarItem = tabBarOption(.free)
        activity.startAnimating()
        configurator.configure(freeAppViewController: self, country: "ve")
        freeTable.registerCell(withIdentifier: "FreeAppTableViewCell")
        presenter.viewDidLoad()
    }
    
    //MARK:SetupViews
    func setupViews(){
        
        //config label
        countryNameLabel.font = Styles.Fonts.country
        countryNameLabel.textColor = Styles.Colors.white
        view.backgroundColor = Styles.Colors.background.color
        
    }
}

extension FreeAppViewController: DataSourceDelegate {
    func rowDidSelected(at index: Int) {
        presenter.didSelect(row: index)
    }
}
