//
//  TabBarRouter.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    
    typealias Submdoules = (shows: UIViewController, persons: UIViewController)
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

extension TabBarRouter {
    
    static func tabs(usingSubModules submodules: Submdoules) -> MazeTabs {
        let showsTabBarItem = UITabBarItem(title: Text.Shows.description, image: UIImage(named: "tab-show-icon"), tag: 101)
        let personsTabBarItem = UITabBarItem(title: Text.SearchPeople.description, image: UIImage(named: "tab-search-icon"), tag: 102)
        
        submodules.shows.tabBarItem = showsTabBarItem
        submodules.persons.tabBarItem = personsTabBarItem
        
        return (shows: submodules.shows, persons: submodules.persons)
    }
}
