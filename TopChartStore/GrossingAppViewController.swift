//
//  GrossingAppStoreViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

let GrossingCellIdentifier = "GrossingCell"

class GrossingAppViewController: UIViewController, GrossingAppView {
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var grossingTable: UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    private let defaults = UserDefaults.standard
    var presenter: GrossingAppPresenter?
    var configurator = GrossingAppConfiguratorImplementation()
    var dataSource: TableDataSource<FreeAppTableViewCell, FreeAppTableViewCellViewModel>? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                
                strongSelf.grossingTable.dataSource = strongSelf.dataSource
                strongSelf.grossingTable.delegate = strongSelf.dataSource
                strongSelf.activity.stopAnimating()
                strongSelf.activity.hidesWhenStopped = true
                strongSelf.grossingTable.reloadData()
            }
        }
    }
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configurator.configure(view: self, country: "ve")
        grossingTable.registerCell(withIdentifier: "FreeAppTableViewCell")
        presenter?.viewDidLoad()
        
    }
    
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        if let countrySaved = defaults.value(forKey: Keys.defaults.countryISO),
//            let country = countrySaved as? Country,
//            let countryName = defaults.value(forKey: Keys.defaults.countryName) as? String {
//            getTGApp(country: country)
//            countryNameLabel.text = countryName
//        }
//
//    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
       getTGApp()
    }
    
    //MARK:
    //MARK:Get TopGrossing app
    private func getTGApp(country:Country?=nil){
        guard let countryCode = Keys.locale.countryCode else { print("Country locale is nil")
            return
        }
        
        activity.startAnimating()
        activity.isHidden = false
        grossingTable.backgroundView?.alpha = 0
    }
    
    
    //MARK:
    //MARK:Open Country List
    static var name: String {
        return "GrossingAppViewController"
    }
    @IBAction func openCountryListAction(_ sender: UITapGestureRecognizer){
        
        let countryListVC: CountryListViewController = UIStoryboard.storyboard(storyboard: .CountryListViewController).instantiateViewController()
        present(countryListVC, animated: true, completion: nil)
    }
}









