//
//  CountryListViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

protocol CountryListViewControllerDelegate: class {
    func countryDidSelected(withModel model: CountryViewModel)
}

class CountryListViewController: UIViewController, CountryView {
    
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
            countryTable.reloadData()
        }
    }
    
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    //MARK:Close View
    @IBAction func closeViewAction(_ sender: UIButton){
        dismiss(animated: true)
    }
    
    func countryDidSelected(withModel model: CountryViewModel) {
        delegate?.countryDidSelected(withModel: model)
        dismiss(animated: true)
    }
    
}
