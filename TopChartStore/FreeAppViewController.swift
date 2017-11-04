//
//  ViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 10/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit
import Gloss

typealias Country = String



class FreeAppViewController: UIViewController{
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var freeTable:UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    //var modelArr = [AppModel]()
    var modelArr: [App] = []
    
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
            getFreedata(country: country)
            countryNameLabel.text = countryName
        }
        
    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
        
        //config label
        countryNameLabel.font = Styles.Fonts.country
        countryNameLabel.textColor = Styles.Colors.white
        view.backgroundColor = Styles.Colors.background.color
        
        UIApplication.shared.statusBarStyle = .lightContent

        getFreedata()
    }
    
    
    //MARK:
    //MARK:Get FreeData
    private func getFreedata(country:Country?=nil){
        
        guard let countryCode = Keys.locale.countryCode else { print("Country locale is nil")
            return
        }
        
        activity.startAnimating()
        activity.isHidden = false
        freeTable.backgroundView?.alpha = 0
        
        JCQueryNetwork().getApps(.FreeApp, country: country ?? countryCode) { (freeResponse) in
            
            self.activity.stopAnimating()
            self.activity.isHidden = true

            switch freeResponse {
            case .Error(let error):
                print("Error \(error)")
                break
            case .Success(let data):
                guard let dictionary = data as? JSON else {print("dic is nil")
                    return
                }
                guard let topApps = TopApps(json: dictionary), let apps = topApps.feed?.results else { print("app is nil")
                    return
                }
                self.modelArr = apps
                UIView.animate(withDuration: 0.4, animations: {
                    self.freeTable.backgroundView?.alpha = 1
                })
                self.freeTable.reloadData()
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
    
    //MARK:
    //MARK:Open Side Menu
    @IBAction func openSideAction(_ sender: UIButton){
        sideMenuController?.toggle()
    }
}

extension FreeAppViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return modelArr.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FreeAppTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FreeAppTableViewCell
        cell.configureFreeCell(with: modelArr[indexPath.row])
        return cell
        
    }

    
}

