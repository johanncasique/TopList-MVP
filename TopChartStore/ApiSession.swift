//
//  ApiSession.swift
//  TopChartStore
//
//  Created by Casique, Johan on 16/08/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol ApiSession {
    var defaultSession: URLSession { get }
}

extension ApiSession {
    var defaultSession: URLSession {
        let config = URLSessionConfiguration.default
        if #available(iOS 11.0, *) {
            config.waitsForConnectivity = true
        } else {
            // Fallback on earlier versions
        }
        return URLSession(configuration: config)
    }
}
