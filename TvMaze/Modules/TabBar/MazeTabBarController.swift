//
//  MazeTabBarController.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

typealias MazeTabs = (shows: UIViewController, persons: UIViewController)

class MazeTabBarController: UITabBarController {
    
    init(tabs: MazeTabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.shows, tabs.persons]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
