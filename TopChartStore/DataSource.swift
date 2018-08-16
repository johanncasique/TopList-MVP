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
    associatedtype T
    func configureFreeCell(with appModel: T)
}

protocol ModelProtocol {
    associatedtype T
    var items: [T]? { get set }
}


class DataSource<Cell: UITableViewCell, Provider: ModelProtocol>: NSObject, UITableViewDataSource, UITableViewDelegate where Cell : ConfigureCellProtocol, Provider.T == Cell.T {
    
    var provider: Provider
    weak var delegate: DataSourceDelegate?
    
    init(provider: Provider, delegate: DataSourceDelegate? = nil) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provider.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell: Cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell,
            let items = provider.items else {
            fatalError()
        }
        
        cell.configureFreeCell(with: items[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.rowDidSelected(at: indexPath.row)
    }
}


public protocol ReusableCell{
    static var reuseIdentifier: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol ConfigurableCell: ReusableCell {
    associatedtype T
    func configure(item: T, at index: IndexPath)
}

protocol TableDataProvider {
    associatedtype T
    
    func numberOfSection() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> T?
    func updateItem(at index: IndexPath, value: T)
}

class TableDataSource<Provider: TableDataProvider, Cell: UITableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate where Cell: ConfigurableCell, Provider.T == Cell.T {
    
    //"where" here it means that Cell has to conform ConfigurableCell protocol and T has to equal for Providar and also Cell
    
    // MARK: - private properties
    let provider: Provider
    let tableView: UITableView
    
    init(tableView: UITableView, provider: Provider) {
        self.provider = provider
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provider.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        
        if let item = provider.item(at: indexPath) {
            cell.configure(item: item, at: indexPath)
        }
        
        return cell
    }
    
    
}
