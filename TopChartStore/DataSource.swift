//
//  DataSource.swift
//  TopChartStore
//
//  Created by Casique, Johan on 09/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

protocol DataSourceDelegate: class {
    func rowDidSelected(at index: Int)
}

protocol ConfigureCellProtocol {
    func configureFreeCell(with appModel: App)
}


class DataSource<T>: NSObject, UITableViewDataSource where T : UITableViewCell {
    
    var items: [App]?
    weak var delegate: DataSourceDelegate?
    var configure: ConfigureCellProtocol?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell: T = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? T,
            let items = items else {
            fatalError()
        }
        configure?.configureFreeCell(with: items[indexPath.row])
        return cell
    }
}
