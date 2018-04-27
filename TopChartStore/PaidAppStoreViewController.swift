//
//  PaidAppStoreViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit


let PaidCellIdentifier = "PaidCell"

class PaidAppsViewController: UIViewController{
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var paidTable: UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    private var paidArr: [App] = []
    private let defaults = UserDefaults.standard
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension PaidAppsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return paidArr.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FreeAppTableViewCell = tableView.dequeueReusableCell(withIdentifier: PaidCellIdentifier, for: indexPath) as! FreeAppTableViewCell
        cell.configureFreeCell(with: paidArr[indexPath.row])
        
        
        return cell
        
    }
}
