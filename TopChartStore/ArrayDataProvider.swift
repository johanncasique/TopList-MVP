//
//  ArrayDataProvider.swift
//  TopChartStore
//
//  Created by Casique, Johan on 10/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

class ArrayDataProvider<T>: TableDataProvider {
    
    var items: [[T]] = []
    
    // MARK: - LifeCycle
    init(array: [[T]]) {
        items = array
    }
    
    func numberOfSection() -> Int {
        return items.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section >= 0 && section < items.count else { return 0 }
        return items[section].count
    }
    
    func item(at indexPath: IndexPath) -> T? {
       
        guard indexPath.section >= 0 &&
            indexPath.section < items.count &&
            indexPath.row >= 0 &&
            indexPath.row < items[indexPath.section].count else {
                return nil
        }
        
        return items[indexPath.section][indexPath.row]
        
    }
    
    func updateItem(at index: IndexPath, value: T) {
        guard index.section >= 0 &&
            index.section < items.count &&
            index.row >= 0 &&
            index.row < items[index.section].count else {
                return
        }
        
        items[index.section][index.row] = value
    }

}
