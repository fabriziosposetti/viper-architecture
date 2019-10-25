//
//  PersonDetailProtocol.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 21/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

protocol PersonDetailViewInterface: class {
    var presenter: PersonDetailPresenterInterface? { get set }
    
    func setupInitialView(person: PersonViewModel)
}


protocol PersonDetailPresenterInterface: class {
    func notifyViewLoaded()
}

protocol PersonDetailRouterInterface: class {
    
}

protocol PersonDetailInteractorInterface {
    
}
