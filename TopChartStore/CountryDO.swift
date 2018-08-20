//
//  ApiCountry.swift
//  TopChartStore
//
//  Created by Casique, Johan on 20/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

struct CountryDO {
    
    private let dto: Country
    
    init(dto: Country) {
        self.dto = dto
    }
    
    var code: String {
        return dto.countryIdentifer.code
    }
    
    var name: String {
        return dto.countryIdentifer.name
    }   
}
