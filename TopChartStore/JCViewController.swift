//
//  JCViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit


extension UIViewController: StoryboardIdentifiable {}

extension UIViewController {
    
    public func showSimpleAlert(title: String, message: String){
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func showAlert(title: String, message: String, completionHandler: @escaping ((Bool) -> Void)){
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (action) in
            completionHandler(true)
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
}
