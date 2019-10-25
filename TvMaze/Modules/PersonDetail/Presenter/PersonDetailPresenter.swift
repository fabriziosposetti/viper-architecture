//
//  PersonDetailPresenter.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 21/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

class PersonDetailPresenter {
    weak var view: PersonDetailViewInterface?
    var router: PersonDetailRouterInterface?
    var interactor: PersonDetailInteractorInterface?
    var person: PersonViewModel?
    
}

extension PersonDetailPresenter: PersonDetailPresenterInterface {
    
    func notifyViewLoaded() {
        if let person = person {
            view?.setupInitialView(person: person)
        }
    }
    
    
}
