//
//  CountryViewModel.swift
//  TopChartStore
//
//  Created by Casique, Johan on 20/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import UIKit

typealias CountryTableData = (countryName: String, flag: UIImage)

struct CountryViewModel {
    
    var name: String?
    var code: String?
    var flag: UIImage?
    
    init(countryDO: CountryDO) {
        country(for: countryDO)
    }
    
    mutating private func country(for countryDO: CountryDO) {
        
        guard let flagImage = UIImage(named: countryDO.code) else { return }
        
        name = countryDO.name
        code = countryDO.code
        flag = flagImage
    }
}
