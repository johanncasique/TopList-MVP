//
//  CountryListViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

protocol CountryListViewControllerDelegate: class {
    func countryDidSelected(withName name: String)
}

class CountryListViewController: UIViewController, CountryView {
    
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var countryTable: UITableView!
    
    weak var delegate: CountryListViewControllerDelegate?
    var presenter: CountryPresenter!
    lazy var configuration: CountryConfiguratorImplementation = {
        return CountryConfiguratorImplementation()
    }()
    private let defaults = UserDefaults.standard
    var dataSource: TableDataSource<CountryTableViewCell, CountryViewModel>? {
        didSet {
            countryTable.dataSource = dataSource
            countryTable.delegate = dataSource
        }
    }
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    
    //MARK:
    //MARK:Close View
    @IBAction func closeViewAction(_ sender: UIButton){
        dismiss(animated: true)
    }
    
    func countryDidSelected(withName name: String) {
        dismiss(animated: true)
        delegate?.countryDidSelected(withName: name)
    }
    
}


