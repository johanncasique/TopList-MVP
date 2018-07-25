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
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configurator.configure(view: self, country: "es")
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
    @IBAction func openCountryListAction(_ sender: UITapGestureRecognizer){
        
        let countryListVC: CountryListViewController = UIStoryboard.storyboard(storyboard: .CountryListViewController).instantiateViewController()
        present(countryListVC, animated: true, completion: nil)
    }
    
    func refreshView() {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
        grossingTable.reloadData()
    }
    
}


extension GrossingAppViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter?.numberOfApps ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FreeAppTableViewCell = tableView.dequeueReusableCell(withIdentifier: GrossingCellIdentifier, for: indexPath) as! FreeAppTableViewCell
        presenter?.configure(cell: cell, forRow: indexPath.row)
        
        return cell
        
    }
    
}
