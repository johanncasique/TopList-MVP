//
//  CountryListViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

let CountryListCellIdentifier = "CountryListCell"

class CountryListViewController: UIViewController{
    
    public enum countryKeys: String {
        case countryISO
    }
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var countryTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    private var countryCode = [String]()
    private var countryName = [String]()
    private let defaults = UserDefaults.standard
    
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
        
        activity.startAnimating()
        activity.isHidden = false
        countryTable.alpha = 0
        DispatchQueue.global(qos: .userInitiated).async {
             self.getCountryISO()
        }
       
    }
    
    
    //MARK:
    //MARK:Get country code and name
    private func getCountryISO(){
        
        for country in NSLocale.isoCountryCodes {
            //Add country code
            //Add country name
            //let pre = Locale.preferredLanguages
            ///print(pre)
         
           
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: country])
            let name = NSLocale(localeIdentifier: "es_ES").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(country)"
            let tempFlagImage = UIImage(named: country)
            if tempFlagImage != nil {
                countryCode.append(country)
                countryName.append(name)
            }
        }
        DispatchQueue.main.async {
            
            self.activity.stopAnimating()
            self.activity.isHidden = true
            UIView.animate(withDuration: 0.4, animations: {
                self.countryTable.reloadData()
                self.countryTable.alpha = 1
            })
        }
        
    }
    
    
    //MARK:
    //MARK:Close View
    @IBAction func closeViewAction(_ sender: UIButton){
        dismiss(animated: true)
    }
    
}



extension CountryListViewController: UITableViewDataSource {
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countryCode.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: CountryListCellIdentifier, for: indexPath) as! CountryTableViewCell
        
        cell.configCountryCell(with: countryCode[indexPath.row], countryName: countryName[indexPath.row])
        
        return cell
    }
}

extension CountryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaults.set(countryCode[indexPath.row], forKey: Keys.defaults.countryISO)
        defaults.set(countryName[indexPath.row], forKey: Keys.defaults.countryName)
        dismiss(animated: true, completion: nil)
    }
    
}


