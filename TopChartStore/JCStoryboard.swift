//
//  JCStoryboard.swift
//  TopChartStore
//
//  Created by Johann Casique on 29/07/2017.
//  Copyright © 2017 Johann Casique. All rights reserved.
//
import UIKit


extension UIStoryboard{
    
    enum Storyboard: String {
        case MasterSideMenuController
        case FreeAppViewController
        case PaidAppsViewController
        case SideMenuViewController
        case GrossingAppViewController
        case CountryListViewController
        //Interesante... se puede meter una variable dentro de un enum, y que a la vez esta variables nos devuelva algo
        var filename: String {
            return rawValue
        }
    }
    
    
    //Este metodo de conveniencia recibe un tipo de Storyboard(enum) y en caso de que no le mandes un bundle, mete por defecto un nil es por esto que Bundle tiene un ? y luego un = nil
    //    convenience init(storyboard: Storyboard, bundle: Bundle? = nil){
    //        self.init(name: storyboard.filename, bundle: bundle)
    //
    //    }
    //Esto es lo mismo que el metodo de conveniencia, pero se ha creado como una clase
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard{
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    
    func instantiateViewController<T: StoryboardIdentifiable>() -> T {
        
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
    
    
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}


extension StoryboardIdentifiable where Self: UIViewController{
    
    static var storyboardIdentifier: String{
        return String(describing: self)
    }
}

