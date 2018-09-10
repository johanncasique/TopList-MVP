//
//  ApiResponse.swift
//  TopChartStore
//
//  Created by johann casique on 21/04/2018.
//  Copyright © 2018 Johann Casique. All rights reserved.
//

import Foundation

protocol InitializableWithData {
    init(data: Data?) throws
}

protocol InitializableWithJson {
    init(json: [String: Any]) throws
}

struct NetworkRequestError: Error {
    let error: Error?
    
    var localizedDescription: String {
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

//reach the Api but return 4xx or 5xx erro
struct ApiError: Error {
    let data: Data?
    let httpUrlResponse: HTTPURLResponse
}

struct ApiParseError: Error {
    static let code = 999
    
    let error: Error
    let httpUrlResponse: HTTPURLResponse?
    let data: Data?
    
    var localizedDescription: String {
        return error.localizedDescription
    }
}

struct ApiResponse<T: InitializableWithData> {
    let entity: T
    let httpUrlResponse: HTTPURLResponse?
    let data: Data?
    
    init(data: Data?, httpUrlResponse: HTTPURLResponse?) throws {
        do {
            self.entity = try T(data: data)
            self.httpUrlResponse = httpUrlResponse
            self.data = data
        } catch {
            throw ApiParseError(error: error, httpUrlResponse: httpUrlResponse, data: data)
        }
    }
}

extension NSError {
    static func createParseError() -> NSError {
        return NSError(domain: "com.fortech.library",
                       code: ApiParseError.code,
                       userInfo: [NSLocalizedDescriptionKey: "A parsing error occured"])
    }
}
