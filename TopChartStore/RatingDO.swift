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
        
        let jsonObject = try? JSONDecoder().decode(RatingFeed.self, from: data)
        guard let first = jsonObject?.results?.first else {
            throw
            NSError.createParseError()
        }

        rating = first
    }
    
    var userRating: String {
        return String(rating.averageUserRating)
    }

    var ratingCount: String {
        return String(rating.userRatingCount)
    }
}
