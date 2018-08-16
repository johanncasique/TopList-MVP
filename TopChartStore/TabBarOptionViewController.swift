////
////  TabBarOptionViewController.swift
////  TopChartStore
////
////  Created by Johann Casique on 29/07/2017.
////  Copyright © 2017 Johann Casique. All rights reserved.
////
//
//import UIKit
//
//class TabBarOptionsViewController: UITabBarController, StoryboardName {
//    
//    //MARK:
//    //MARK:Variables and Iboutlets
//    var name: String {
//        return 
//    }
//    
//    //MARK:
//    //MARK:Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupViews()
//    }
//    
//    //MARK:
//    //MARK:SetupViews
//    func setupViews(){
//        
//        var vcArray = [UIViewController]()
//        
//        //Set FreeAppsViewController
////        let freeAppVC: FreeAppViewController = UIStoryboard.storyboard(storyboard: .FreeAppViewController).instantiateViewController()
////        let freeNav: UINavigationController = UINavigationController(rootViewController: freeAppVC)
////
////        freeNav.isNavigationBarHidden = true
////        vcArray.append(freeNav)
////
////        //Set PaidAppsViewController
////        let paidVC: PaidAppsViewController = UIStoryboard.storyboard(storyboard: .PaidAppsViewController).instantiateViewController()
////        let paidNav: UINavigationController = UINavigationController(rootViewController: paidVC)
////        paidNav.isNavigationBarHidden = true
////        vcArray.append(paidNav)
////
////        //Set GrossingAppStoreViewController
////        let grossingVC: GrossingAppViewController = UIStoryboard.storyboard(storyboard: .GrossingAppViewController).instantiateViewController()
////        let grossingNav: UINavigationController = UINavigationController(rootViewController: grossingVC)
////        grossingNav.isNavigationBarHidden = true
////        vcArray.append(grossingNav)
//        
//        
//        viewControllers = vcArray
//        
////        let freeItem = UITabBarItem(title: "Free", image: #imageLiteral(resourceName: "icFree"), selectedImage: #imageLiteral(resourceName: "icFreeSelected"))
////        freeNav.tabBarItem = freeItem
////
////        let paidItem = UITabBarItem(title: "Paid", image: #imageLiteral(resourceName: "icPaid"), selectedImage: #imageLiteral(resourceName: "icPaid"))
////        paidNav.tabBarItem = paidItem
////
////        grossingNav.tabBarItem = UITabBarItem(title: "Grossing", image: #imageLiteral(resourceName: "icGrossing"), selectedImage: #imageLiteral(resourceName: "icGrossing"))
//        
//        
//        
//        tabBar.barTintColor = UIColor.black
//        
//        
//        
//        
//        
//    }
//}
