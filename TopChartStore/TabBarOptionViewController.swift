//
//  TabBarOptionViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

class TabBarOptionsViewController: UITabBarController {
    
    //MARK:
    //MARK:Variables and Iboutlets
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        setupViews()
        super.viewDidLoad()
        
        for view in viewControllers! {
            
            guard let navigation = view as? UINavigationController else { break }
            
            switch navigation.rootViewController {
            case let freeVC where freeVC is FreeAppViewController:
                freeVC?.tabBarItem = UITabBarItem(title: "Free", image: #imageLiteral(resourceName: "icFree"), selectedImage: #imageLiteral(resourceName: "icFreeSelected"))
            case let paidVC where paidVC is PaidAppsViewController:
                paidVC?.tabBarItem = UITabBarItem(title: "Paid", image: #imageLiteral(resourceName: "icPaid"), selectedImage: #imageLiteral(resourceName: "icPaid"))
            case let grossingVC where grossingVC is GrossingAppViewController:
                grossingVC?.tabBarItem = UITabBarItem(title: "Grossing", image: #imageLiteral(resourceName: "icGrossing"), selectedImage: #imageLiteral(resourceName: "icGrossing"))
            default: break
            }
        }
        
        
    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
        tabBar.barTintColor = Styles.Colors.navigationBar.color
    }
}

extension UINavigationController {
    var rootViewController: UIViewController? {
        return childViewControllers.first
    }
}
