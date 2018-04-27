//
//  TopApp.swift
//  TopChartStore
//
//  Created by johann casique on 03/11/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation

struct TopApps: Codable {
    let feed: Feed?
}

struct Feed: Codable {
    let results: [App]?
}

struct App: Codable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let kind: URL?
    let copyright: String?
    let artistId: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let genres: [Genres]?
    let url: String?
}

struct Genres: Codable {
    let genreId: String?
    let name: String?
    let url: String?
}


