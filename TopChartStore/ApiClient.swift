//
//  ApiClient.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiRequest {
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

protocol ApiClient {
    func execute<T>(request: ApiRequest, completionHandler: @escaping (_ result: Result<ApiResponse<T>>) -> Void)
}


class ApiClientImplementation: ApiClient {

    let session: SessionManager
    
    init(session: SessionManager) {
        self.session = session
    }
    
    func execute<T>(request: ApiRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) where T : InitializableWithData {
        
        session.request(request.url, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).responseData { (data) in
            
            guard let httpUrlResponse = data.response else {
                completionHandler(.failure(NetworkRequestError(error: data.error)))
                return
            }
            
            let successRange = 200...299
            
            if successRange.contains(httpUrlResponse.statusCode) {
                do {
                    let response = try ApiResponse<T>(data: data.data, httpUrlResponse: httpUrlResponse)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(error))
                }
            } else {
                completionHandler(.failure(ApiError(data: data.data, httpUrlResponse: httpUrlResponse)))
            }
        }
    }
}
