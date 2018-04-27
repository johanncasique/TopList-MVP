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



class FreeAppViewController: UIViewController, FreeAppView {
   
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var freeTable:UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var modelArr: [App] = []
    var presenter: FreeAppPresenter!
    var configurator = FreeAppConfiguratorConfigurator()
    private let defaults = UserDefaults.standard
    
    func refreshAppView() {
        
    }
    
    func displayBooksRetrievalError(title: String, message: String) {
        
    }
    
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(freeAppViewController: self)
        presenter.viewDidLoad()
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//    if let countrySaved = defaults.value(forKey: Keys.defaults.countryISO),
//            let country = countrySaved as? Country,
//        let countryName = defaults.value(forKey: Keys.defaults.countryName) as? String {
//
//            countryNameLabel.text = countryName
//        }
//
//    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
        
        //config label
        countryNameLabel.font = Styles.Fonts.country
        countryNameLabel.textColor = Styles.Colors.white
        view.backgroundColor = Styles.Colors.background.color
        
        UIApplication.shared.statusBarStyle = .lightContent

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

