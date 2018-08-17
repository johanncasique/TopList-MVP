//
//  TabBarOptionViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

enum TabBarOptions {
    case free
    case paid
    case grossing
}

protocol TabBarConfigurationProtocol {
    func tabBarOption(_ option: TabBarOptions) -> UITabBarItem
}

extension TabBarConfigurationProtocol {
    
    func tabBarOption(_ option: TabBarOptions) -> UITabBarItem {
        switch option {
        case .free:
            return UITabBarItem(title: "Free", image: #imageLiteral(resourceName: "icFree"), selectedImage: #imageLiteral(resourceName: "icFreeSelected"))
        case .paid:
            return UITabBarItem(title: "Paid", image: #imageLiteral(resourceName: "icPaid"), selectedImage: #imageLiteral(resourceName: "icPaid"))
        case .grossing:
            return UITabBarItem(title: "Grossing", image: #imageLiteral(resourceName: "icGrossing"), selectedImage: #imageLiteral(resourceName: "icGrossing"))
        }
    }
}

class TabBarOptionsViewController: UITabBarController {
    
    //MARK:
    //MARK:Variables and Iboutlets
    enum ViewController {
        case view(UIViewController)
    }
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in viewControllers! {
        
            if view is FreeAppViewController {
                (view as? FreeAppViewController)?.tabBarItem = UITabBarItem(title: "Free", image: #imageLiteral(resourceName: "icFree"), selectedImage: #imageLiteral(resourceName: "icFreeSelected"))
            }
            
        }
        
        setupViews()
    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
        tabBar.backgroundColor = Styles.Colors.navigationBar.color
    }
}
