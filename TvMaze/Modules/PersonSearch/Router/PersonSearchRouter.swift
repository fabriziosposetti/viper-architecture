//
//  PersonSearchRouter.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class PersonSearchRouter {
    weak var viewController: UIViewController?

}

extension PersonSearchRouter: PersonSearchRouterInterface {
    
    func presentPersonDetail(forPerson person: PersonViewModel) {
        
        let personDetailView = MazeModule.createPersonDetailModule(forPerson: person)
        
        viewController?.navigationController?.pushViewController(personDetailView, animated: true)
        
    }
    
    
}
