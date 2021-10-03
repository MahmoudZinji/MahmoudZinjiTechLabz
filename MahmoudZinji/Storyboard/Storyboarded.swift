//
//  Storyboarded.swift
//  MVVM Coordinator
//
//  Created by monty on 24/11/20.
//

import Foundation
import UIKit

enum Storyboard:String{
    case Recipes = "Recipes"
}

protocol Storyboarded {
    static func instantiateFrom(storyboard:Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {

    static func instantiateFrom(storyboard:Storyboard) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: id) as! Self
        return viewController
    }
}
