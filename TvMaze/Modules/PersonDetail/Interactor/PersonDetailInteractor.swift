//
//  PersonDetailInteractor.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 21/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

class PersonDetailInteractor {
    
    weak var presenter: PersonDetailPresenterInterface?
    var personRepository: PersonRepositoryProtocol?
    
    init(personRepository: PersonRepositoryProtocol) {
        self.personRepository = personRepository
    }
    
}

extension PersonDetailInteractor: PersonDetailInteractorInterface {
    
}
