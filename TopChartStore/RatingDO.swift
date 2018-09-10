//
//  RatingDO.swift
//  TopChartStore
//
//  Created by Casique, Johan on 06/09/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

struct RatingDO: InitializableWithData {
    
    private let rating: Rating
    
    init(data: Data?) throws {
        guard let data = data else { throw
            NSError.createParseError()
        }
        
        do {
            let jsonObject = try JSONDecoder().decode(RatingFeed.self, from: data)
            
            guard let first = jsonObject.results?.first else {
                throw
                    NSError.createParseError()
            }
            rating = first
        } catch let error {
            print(error)
            throw NSError.createParseError()
        }
    }
    
    var userRating: String {
        guard let userRating = rating.averageUserRating else { return "" }
        return String(userRating)
    }

    var ratingCount: String {
        guard let ratingCount = rating.userRatingCount else { return "" }
        return String(ratingCount)
    }
}
