//
//  JCViewCell.swift
//  TopChartStore
//
//  Created by Johann Casique on 19/08/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//

import UIKit


extension CALayer {
    
    
    public func shadowAlpha(with alpha: Float, radius: CGFloat, positionX: Double, positionY: Double, color: UIColor){
        
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: positionX, height: positionY)
        shadowRadius = radius
        
    }
    
    
    
}
