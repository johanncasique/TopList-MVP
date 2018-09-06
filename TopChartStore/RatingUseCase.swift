//
//  RatingUseCase.swift
//  TopChartStore
//
//  Created by Casique, Johan on 06/09/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

class RatingUseCase: RatingUseCaseProtocolImplementation {
    
    var ratingGateway: RatingGateway
    var idApp: String
    
    init(gateway: RatingGateway, idApp: String) {
        self.ratingGateway = gateway
        self.idApp = idApp
    }

    func getRating(completionHandler: @escaping RatingCompletionHandler) {
        
        ratingGateway.getRating(withRequest: RatingRequest(idApp: idApp)) { (rating) in
            completionHandler(rating)
        }
    }
}
