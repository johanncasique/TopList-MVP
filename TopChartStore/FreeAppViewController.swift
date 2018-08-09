//
//  ViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 10/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

typealias Country = String

class FreeAppViewController: UIViewController, FreeAppView {
    
    //MARK:Variables and Iboutlets
    @IBOutlet weak var freeTable:UITableView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var presenter: FreeAppPresenter!
    var configurator = FreeAppConfiguratorConfigurator()
    private let defaults = UserDefaults.standard
    var dataSource: DataSource<FreeAppTableViewCell>? {
        didSet {
            freeTable.dataSource = dataSource
            freeTable.reloadData()
            activity.stopAnimating()
            activity.hidesWhenStopped = true
        }
    }
    
    func refreshAppView() {
//        freeTable.reloadData()
//        activity.stopAnimating()
//        activity.hidesWhenStopped = true
    }
    
    func displayBooksRetrievalError(title: String, message: String) {
        
    }
    
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity.startAnimating()
        configurator.configure(freeAppViewController: self, country: "ve")
        presenter.viewDidLoad()
    }
    
    //MARK:SetupViews
    func setupViews(){
        
        //config label
        countryNameLabel.font = Styles.Fonts.country
        countryNameLabel.textColor = Styles.Colors.white
        view.backgroundColor = Styles.Colors.background.color
    }
}

//extension FreeAppViewController: UITableViewDataSource {
//
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return presenter.numberOfApps
//    }
//
//    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell: FreeAppTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FreeAppTableViewCell
//        presenter.configure(cell: cell, forRow: indexPath.row)
//        return cell
//    }
//}
