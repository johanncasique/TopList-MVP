//
//  JCNetworkError.swift
//  TopChartStore
//
//  Created by Johann Casique on 11/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import Foundation

class JCNetworkError: NSObject {
    
    enum ErrorType: Int{
        case clientTokenError = 401
        case adminAuth = 403
        case userTokenError = 412
        case success = 200
    }
    
    enum ErrorResult{
        case Success
        case ErrorMessage
        
    }
    
    
    public func handlderError(response: HTTPURLResponse,  completionHandler: @escaping (ErrorResult) -> Void){
        
        switch response.statusCode {
        case ErrorType.clientTokenError.rawValue:
            print("\n\nERROR CODE \(ErrorType.clientTokenError.rawValue): No autorizado, el token de usuario no es correcto o está expirado\n\n")
            completionHandler(.ErrorMessage)
            break
        case ErrorType.adminAuth.rawValue:
            print("\n\nERROR CODE \(ErrorType.adminAuth.rawValue): Zona restringida, es necesario usar autenticación de administrador\n\n")
            completionHandler(.ErrorMessage)
            break
        case ErrorType.userTokenError.rawValue:
            print("\n\nERROR CODE \(ErrorType.userTokenError.rawValue):Falta el token de usuario necesario para ejecutar el servicio REST\n\n")
            completionHandler(.ErrorMessage)
            break
        case ErrorType.success.rawValue:
            completionHandler(.Success)
        default:
            break
        }
        
    }
}
