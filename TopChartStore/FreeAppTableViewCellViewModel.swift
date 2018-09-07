//
//  FreeAppTableViewCellViewModel.swift
//  TopChartStore
//
//  Created by Casique, Johan on 06/09/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import AlamofireImage

class FreeAppTableViewCellViewModel: ApiSession {
    
    private var modelApp: App
    var ratingUseCase: RatingUseCase!
    
    
    init(model: App) {
        self.modelApp = model
    }
    
    var name: String {
        return modelApp.name ?? ""
    }
    
    var buyButton: String {
        return "GET"
    }
    
    var inAppPurchase: String {
        return "Offers In-App\n Purchases"
    }
    
    var companyName: String {
        return modelApp.artistName ?? ""
    }
    
    var iconImageURL: URL? {
        guard let stringURL = modelApp.artworkUrl100, let url = URL(string: stringURL) else { return nil }
        return url
    }
    
    func getRating(completion: @escaping (_ rating: String) -> Void) {
        
        let apiClient = ApiClientImplementation(session: defaultSession)
        let apiAppsGateway = RatingGatewayImplementation(client: apiClient)
        
        ratingUseCase = RatingUseCase(gateway: apiAppsGateway, idApp: modelApp.id ?? "")
        
        ratingUseCase.getRating { result in
            switch result {
            case let .success(rating):
                print(rating)
                completion(rating.userRating)
            case let .failure(error):
                print(error)
            }
        }
    }
}
