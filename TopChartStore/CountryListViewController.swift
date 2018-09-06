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

class CountryListViewController: BaseViewController, CountryView {
    
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
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Country"
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.tintColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        
        navigationItem.searchController = searchController
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white,
                                                                   .font : Styles.Fonts.countrySearch]
        navigationController?.navigationBar.tintColor = .gray
        definesPresentationContext = true
        title = "Countries"
        
        configBarButton(.closeCountries)
        configuration.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    func countryDidSelected(withModel model: CountryViewModel) {
        if searchController.searchBar.isFirstResponder {
            searchController.searchBar.resignFirstResponder()
            dismiss(animated: true)
        }
        delegate?.countryDidSelected(withModel: model)
        dismiss(animated: true)
    }
    
    override func closeCountryView() {
        dismiss(animated: true)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func reloadData() {
        countryTable.reloadData()
    }
    
    func searchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarEmpty()
    }
}

extension CountryListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.filterContentForSearchText(searchController.searchBar.text!)
    }
}
