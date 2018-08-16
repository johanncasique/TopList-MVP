//
//  Keys.swift
//  TopChartStore
//
//  Created by johann casique on 04/11/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation

enum Keys {
    enum defaults {
        static let countryISO = "countryISO"
        static let countryName = "CountryName"
    }
    
    enum locale {
        static let countryCode = Locale.current.regionCode
    }
}
