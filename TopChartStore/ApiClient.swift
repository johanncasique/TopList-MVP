//
//  ApiClient.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation


enum ApiHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol ApiRequest {
    var url: String { get }
    var method: ApiHTTPMethod { get }
    //var parameters: Parameters? { get }
    //var encoding: ParameterEncoding { get }
    //var headers: HTTPHeaders? { get }
}

protocol ApiClient {
    func execute<T>(request: ApiRequest, completionHandler: @escaping (_ result: Result<ApiResponse<T>>) -> Void)
}


class ApiClientImplementation: ApiClient {

    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func execute<T>(request: ApiRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) where T : InitializableWithData {
        
        guard let urlRequest = URL(string: request.url) else {
            completionHandler(.failure(NetworkRequestError(error: nil)))
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            guard let strongSelf = self else { return }
            
            strongSelf.session.dataTask(with: urlRequest) { data, response, error in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(NetworkRequestError(error: error)))
                    return
                }
                
                let succesRange = 200...299
                
                if succesRange.contains(httpResponse.statusCode) {
                    do {
                        let response = try ApiResponse<T>(data: data, httpUrlResponse: httpResponse)
                        completionHandler(.success(response))
                    } catch {
                        completionHandler(.failure(error))
                    }
                } else {
                    completionHandler(.failure(ApiError(data: data, httpUrlResponse: httpResponse)))
                }
            }.resume()
        }
    }
}
