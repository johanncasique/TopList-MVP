//
//  PaidAppStoreViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit


let PaidCellIdentifier = "PaidCell"

class PaidAppsViewController: UIViewController, PaidAppView {
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var paidTable: UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var presenter: PaidAppPresenter?
    var configurator = PaidAppConfiguratorImplementation()
    
    private let defaults = UserDefaults.standard
    var dataSource: TableDataSource<FreeAppTableViewCell, App>? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.paidTable.dataSource = strongSelf.dataSource
                strongSelf.paidTable.delegate = strongSelf.dataSource
                strongSelf.paidTable.reloadData()
                strongSelf.activity.stopAnimating()
                strongSelf.activity.hidesWhenStopped = true
            }
            
        }
    }
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activity.startAnimating()
        configurator.configure(paidAppViewController: self, country: "ve")
        paidTable.registerCell(withIdentifier: "FreeAppTableViewCell")
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let countrySaved = defaults.value(forKey: Keys.defaults.countryISO),
            let country = countrySaved as? Country,
            let countryName = defaults.value(forKey: Keys.defaults.countryName) as? String {
            
            countryNameLabel.text = countryName
        }
        
    }
}
