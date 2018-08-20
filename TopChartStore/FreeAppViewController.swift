//
//  ViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 10/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

class FreeAppViewController: UIViewController, FreeAppView {
    
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icSideMenu"), style: .plain, target: self, action: #selector(loadCountry))
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
    
    @objc func loadCountry() {
        print("loadCountry")
    }
}

extension FreeAppViewController: DataSourceDelegate {
    func rowDidSelected(at index: Int) {
        presenter.didSelect(row: index)
    }
}
