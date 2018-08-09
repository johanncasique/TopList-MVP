//
//  FreeAppTableViewCell.swift
//  TopChartStore
//
//  Created by Johann Casique on 11/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class FreeAppTableViewCell: UITableViewCell, ConfigureCellProtocol {
    
    //MARK:
    //MARK:Variables and Iboutlets
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var appCompanyLabel: UILabel!
    @IBOutlet weak var ratingNumberLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var inAppPurchaseLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
   override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:
    //MARK:Configure Cell
    public func configureFreeCell(with appModel: App){
        
        backView.layer.cornerRadius = 10
        backView.layer.borderWidth = 0.1
        backView.layer.borderColor = UIColor.lightGray.cgColor
        backView.layer.shadowAlpha(with: 0.5, radius: 2, positionX: 0.3, positionY: 2.5, color: .lightGray)
        
        if let stringImage = appModel.artworkUrl100, let urlImage = URL(string: stringImage) {
            appImage.af_setImage(withURL: urlImage, placeholderImage: #imageLiteral(resourceName: "placeHolderIconApp"), imageTransition: .crossDissolve(0.2))
        }
        appImage.layer.cornerRadius = 15
        appImage.layer.borderColor = UIColor.gray.cgColor
        appImage.layer.borderWidth = 0.3
        appImage.clipsToBounds = true
        appTitleLabel.text = appModel.name
        //appCompanyLabel.text = appModel.company
        ratingNumberLabel.text = "4.5"
        getButton.setTitle("GET", for: .normal)
        getButton.layer.cornerRadius = 10
        inAppPurchaseLabel.text = "Offers In-App\n Purchases"
        
    }
}
