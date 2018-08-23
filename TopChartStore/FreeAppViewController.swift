//
//  ViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 10/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

class FreeAppViewController: BaseViewController, FreeAppView {
    
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
    var countryName: String {
        get {
            return countryNameLabel.text!
        }
        set {
            countryNameLabel.text = newValue
        }
    }
    
    
    func displayBooksRetrievalError(title: String, message: String) {
        
    }
    
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBarButton()
        freeTable.registerCell(withIdentifier: "FreeAppTableViewCell")
        loadData("ve")
        
    }
    
    // MARK: - loadData
    func loadData(_ country: String) {
        dataSource?.emptyDataSource()
        freeTable.reloadData()
        activity.startAnimating()
        configurator.configure(freeAppViewController: self, country: country)
        presenter.viewDidLoad()
    }
    
    //MARK:SetupViews
    func setupViews(){
        
        //config label
        countryNameLabel.font = Styles.Fonts.country
        countryNameLabel.textColor = Styles.Colors.white
        view.backgroundColor = Styles.Colors.background.color
        
    }
    
    override func loadCountryFunc() {
        presenter.loadCountry()
    }
    
    override func searchAppFunc() {
        print("search")
    }
   
}

extension FreeAppViewController: DataSourceDelegate {
    func rowDidSelected(at index: Int) {
        presenter.didSelect(row: index)
    }
}

