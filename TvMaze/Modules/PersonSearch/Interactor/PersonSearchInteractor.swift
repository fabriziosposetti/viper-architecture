//
//  PersonSearchInteractor.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

class PersonSearchInteractor {
    
    var personRepository: PersonRepositoryProtocol?
    weak var presenter: PersonSearchPresenterInterface?
    
    init(personRepository: PersonRepositoryProtocol) {
        self.personRepository = personRepository
    }
}

extension PersonSearchInteractor: PersonSearchInteractorInterface {
    
    func fetchPersons(name: String) {
        personRepository?.getPersons(name: name)
        .done { (persons: [People]) in
                self.presenter?.personsFetched(persons: persons)
            }
                
            .catch { error in
                self.presenter?.personsFetchedFailed(withError: error.localizedDescription)
            }
    }
    
    
}
