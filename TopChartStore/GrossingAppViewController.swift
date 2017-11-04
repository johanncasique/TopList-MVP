//
//  GrossingAppStoreViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit
import Gloss

let GrossingCellIdentifier = "GrossingCell"

class GrossingAppViewController: UIViewController{
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var grossingTable: UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    private var grossingArr: [App] = []
    private let defaults = UserDefaults.standard
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let countrySaved = defaults.value(forKey: Keys.defaults.countryISO),
            let country = countrySaved as? Country,
            let countryName = defaults.value(forKey: Keys.defaults.countryName) as? String {
            getTGApp(country: country)
            countryNameLabel.text = countryName
        }
        
    }
    
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
        
        JCQueryNetwork().getApps(.grossingApp, country: country ?? countryCode) { (paidResponse) in
            
            switch paidResponse {
            case .Error(let error):
                print(error)
                break
            case .Success(let data):
                
                guard let dictionary = data as? JSON else {print("dic is nil")
                    return
                }
                guard let topApps = TopApps(json: dictionary), let apps = topApps.feed?.results else { print("app is nil")
                    return
                }
                
                self.activity.stopAnimating()
                self.activity.isHidden = true
                self.grossingTable.backgroundView?.alpha = 1
                self.grossingArr = apps
                self.grossingTable.reloadData()
                
                break
            }
            
        }
    }
    
    //MARK:
    //MARK:Open Country List
    @IBAction func openCountryListAction(_ sender: UITapGestureRecognizer){
        
        let countryListVC: CountryListViewController = UIStoryboard.storyboard(storyboard: .CountryListViewController).instantiateViewController()
        present(countryListVC, animated: true, completion: nil)
    }
    
}

extension GrossingAppViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return grossingArr.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FreeAppTableViewCell = tableView.dequeueReusableCell(withIdentifier: GrossingCellIdentifier, for: indexPath) as! FreeAppTableViewCell
        cell.configureFreeCell(with: grossingArr[indexPath.row])
        
        return cell
        
    }
    
}
