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

public protocol ReusableCell{
    static var reuseIdentifier: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol ConfigureCellProtocol: ReusableCell {
    associatedtype T
    func configureFreeCell(with appModel: T)
}

class TableDataSource<Cell: UITableViewCell, T>: NSObject, UITableViewDataSource, UITableViewDelegate where Cell : ConfigureCellProtocol, T == Cell.T {
    
    var items: ArrayDataProvider<T>
    weak var delegate: DataSourceDelegate?
    
    private init(provider: [[T]], delegate: DataSourceDelegate? = nil) {
        self.items = ArrayDataProvider<T>(array: provider)
        self.delegate = delegate
    }
    
    convenience init(array: [T], delegate: DataSourceDelegate? = nil) {
        self.init(provider: [array], delegate: delegate)
        
    }
    
    func emptyDataSource() {
        items.delete()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell: Cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell,
            let item = items.item(at: indexPath) else {
            fatalError()
        }
        
        cell.configureFreeCell(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.rowDidSelected(at: indexPath.row)
    }
    
    func updateItem(at index: IndexPath, value: T) {
        items.updateItem(at: index, value: value)
    }
}
