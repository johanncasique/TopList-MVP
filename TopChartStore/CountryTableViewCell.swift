//
//  CountryTableViewCell.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell, ConfigureCellProtocol {
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagsImage: UIImageView!
    
    
    //MARK:
    //MARK:Config Cell
//    public func configCountryCell(with countryCode: String, countryName: String){
//
//        countryNameLabel.text = countryName
//        countryFlagsImage.image = UIImage(named: countryCode)
//    }
    
    func configureFreeCell(with appModel: CountryViewModel) {
        
        countryNameLabel.text = appModel.name
        countryFlagsImage.image = appModel.flag
        
    }
}
