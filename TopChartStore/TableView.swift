//
//  TableView.swift
//  TopChartStore
//
//  Created by Casique, Johan on 17/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerCells(withIdentiers identifiers: [String]) {
        for i in identifiers {
            register(UINib(nibName: i, bundle: nil), forCellReuseIdentifier: i)
        }
    }
}
