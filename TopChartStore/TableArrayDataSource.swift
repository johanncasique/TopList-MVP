//
//  TableArrayDataSource.swift
//  TopChartStore
//
//  Created by Casique, Johan on 10/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

class TableArrayDataSource<T, Cell: UITableViewCell>: TableDataSource<ArrayDataProvider<T>, Cell> where Cell: ConfigurableCell , Cell.T == T {
    
    // MARK: - LifeCycle
    public convenience init(tableView: UITableView, array: [T]) {
        self.init(tableView: tableView, array: [array])
    }
    
    public init(tableView: UITableView, array: [[T]]) {
        let provider = ArrayDataProvider(array: array)
        super.init(tableView: tableView, provider: provider)
    }
    
    public func item(at indexPath: IndexPath) -> T? {
        return provider.item(at: indexPath)
    }
    
    public func updateItem(at indexPath: IndexPath, value: T) {
        provider.updateItem(at: indexPath, value: value)
    }
}
