//
//  MasterSideViewController.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit
import SideMenuController

class MasterSideViewController: SideMenuController{
    
    //MARK:
    //MARK:Variables and Iboutlets
    //  @IBOutlet weak var sideMenuButton: UIButton!
    
    
    //MARK:
    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    //MARK:
    //MARK:SetupViews
    func setupViews(){
        
        //SideMenuVC
        let sideMenuVC: SideMenuViewController = UIStoryboard.storyboard(storyboard: .SideMenuViewController).instantiateViewController()
        embed(sideViewController: sideMenuVC)
        
        //CenterVC
        let tabBarVC: TabBarOptionsViewController = TabBarOptionsViewController()
        //let centerVC: FreeAppViewController = UIStoryboard.storyboard(storyboard: .FreeAppViewController).instantiateViewController()
        embed(centerViewController: tabBarVC)
        
        //        //HelpVC
        //        let helpVC: HelpViewController = UIStoryboard.storyboard(storyboard: .HelpViewController).instantiateViewController()
        //        embed(centerViewController: helpVC)
        
        
    }
    
    
    
    //MARK:
    //MARK:SideMenu Init
    required init?(coder aDecoder: NSCoder) {
        
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 380
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .slideAnimation
        super.init(coder: aDecoder)
    }
    
    
    //MARK:
    //MARK:SideMenu button action
    @IBAction func nameFunction(_ sender: UIButton){
        
        
    }
}
