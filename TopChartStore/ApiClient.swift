//
//  ApiClient.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation
import UIKit


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
    func executedCached<T>(request: ApiRequest, completionHandler: @escaping (_ result: Result<ApiResponse<T>>) -> Void)
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
    
    func executedCached<T>(request: ApiRequest, completionHandler: @escaping ((Result<ApiResponse<T>>) -> Void)) where T : InitializableWithData {
       
        let cache = CacheText().loadText(urlString: request.url) { (result) in
            
        }
    }
}



class CacheText {
    
    static let stringCache = NSCache<NSString, DiscardableStringCacheItem>()
    var shouldUseEmptyString = true
    
    private var urlStringForChecking: String?
    private var emptyString: String?
    
    
    func loadText<T>(urlString: String, completion: ((Result<ApiResponse<T>>) -> ())? = nil) {
        
        self.urlStringForChecking = urlString
        let urlKey = urlString as NSString
        
        if let cachedText = CacheText.stringCache.object(forKey: urlKey) {
            do {
                let response = try ApiResponse<T>(data: cachedText.data, httpUrlResponse: nil)
                completion?(.success(response))
            } catch {
                completion?(.failure(error))
            }
            return
        }
        
        guard let url = URL(string: urlString) else {
            if shouldUseEmptyString {
                
            }
            return
        }
        
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion?(.failure(NetworkRequestError(error: error)))
                return
            }
            let succesRange = 200...299
            
            if succesRange.contains(httpResponse.statusCode) {
                do {
                    let cacheItem = DiscardableStringCacheItem(text: data!)
                    CacheText.stringCache.setObject(cacheItem, forKey: urlKey)
                    let response = try ApiResponse<T>(data: data, httpUrlResponse: httpResponse)
                    completion?(.success(response))
                } catch {
                    completion?(.failure(error))
                }
            } else {
                completion?(.failure(ApiError(data: data, httpUrlResponse: httpResponse)))
            }
        }.resume()
    }
}
