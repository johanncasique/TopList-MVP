//
//  ApiClient.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import PromiseKit


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
    let ratingCache = NSCache<NSString, NSData>()
    
    init(session: URLSession) {
        self.session = session    
    }
    
    func execute<T>(request: ApiRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) where T : InitializableWithData {
        
        
        guard let urlRequest = URL(string: request.url) else {
            completionHandler(.failure(NetworkRequestError(error: nil)))
            return
        }
        
        var fetchData = session.dataTask(.promise, with: urlRequest).compactMap {
            return try ApiResponse<T>(data: $0.data, httpUrlResponse: $0.response as! HTTPURLResponse)
        }
        
        func fecth() -> Promise<(data: Data, response: URLResponse)> {
            return session.dataTask(.promise, with: urlRequest)
        }
//
//        firstly {
//            fetchData
//            }.done { result in
//                completionHandler(.success(result))
//            }.catch { error in
//                completionHandler(.failure(error))
//        }


//        firstly {
//            fecth()
//            }.compactMap { data, response in
//              try ApiResponse<T>(data: data, httpUrlResponse: response as! HTTPURLResponse)
//            }.done { result in
//                completionHandler(.success(result))
//            }.catch { error in
//                print(error)
//                completionHandler(.failure(error))
//        }
        
        if let dataFromCache = ratingCache.object(forKey: urlRequest.absoluteString as NSString) {
            let data = Data(referencing: dataFromCache)
            do {
                let response = try ApiResponse<T>(data: data, httpUrlResponse: nil)
                completionHandler(.success(response))
            } catch {
               completionHandler(.failure(error))
            }
            return 
        }
        
        
        session.dataTask(with: urlRequest) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(NetworkRequestError(error: error)))
                return
            }
            let succesRange = 200...299

            if succesRange.contains(httpResponse.statusCode) {
                do {
                    let dataCache = NSData(data: data!)
                    let urlCache = urlRequest.absoluteString as NSString
                    self.ratingCache.setObject(dataCache, forKey: urlCache)
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
