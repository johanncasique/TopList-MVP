//
//  Styles.swift
//  TopChartStore
//
//  Created by johann casique on 04/11/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit

enum Styles {
    
    enum Text {
        static let country: CGFloat = 40
    }
    
    
    enum Fonts {
        static let country = UIFont.boldSystemFont(ofSize: Styles.Text.country)
    }
    
    enum Colors {
        static let white = UIColor.white
        static let background = "0B1325"
        
    }
    
}

extension String {
    
    public var color: UIColor {
        return UIColor.fromHex(self)
    }
    
}
