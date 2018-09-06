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
        let ratingUseCase = RatingUseCase(gateway: apiAppsGateway, idApp: modelApp.artistId ?? "")
        
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
    
    
    
    
//    let apiClient =  ApiClientImplementation(session: defaultSession)
//    let apiAppsGateway = ApiAppsGatewayImplemantation(apiClient: apiClient)
//    let displayAppsUseCase = TopFreeAppsUseCaseImplementation(appsGateway: apiAppsGateway, country: country)
//    let router = TopFreeAppsRouterImplementation(freeAppViewController: freeAppViewController)
//
//    let presenter = FreeAppPresenterImplementation(view: freeAppViewController,
//                                                   displayAppUseCase: displayAppsUseCase,
//                                                   router: router)
//    freeAppViewController.presenter = presenter
    
}
