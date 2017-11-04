//
//  TopApp.swift
//  TopChartStore
//
//  Created by johann casique on 03/11/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation
import Gloss

typealias Decodable = Gloss.Decodable

public struct TopApps: Decodable {
    public let feed: Feed?
    
    public init?(json: JSON){
        self.feed = "feed" <~~ json
    }
}

public struct Feed: Decodable {
    public let results: [App]?
    
    public init?(json: JSON){
        self.results = "results" <~~ json
    }
}

public struct App: Decodable {
    
    public let name: String?
    public let idApp: String?
    public let company: String?
    public let iconImage: URL?
    
    public init?(json: JSON){
        self.name = "name" <~~ json
        self.idApp = "id" <~~ json
        self.company = "artistName" <~~ json
        self.iconImage = "artworkUrl100" <~~ json
    }
    
    
    
}
