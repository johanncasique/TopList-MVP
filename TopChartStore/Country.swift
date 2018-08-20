//
//  Country.swift
//  TopChartStore
//
//  Created by Casique, Johan on 20/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

struct Country {
    private var countryIdentifer: (code: String, name: String)
    
    init(code: String, name: String) {
        countryIdentifer = (code, name)
    }
}
