//
//  NavigationBuilder.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> UINavigationController

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navBar = UINavigationController(rootViewController: rootView)
        return navBar
    }
    
}
