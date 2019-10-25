//
//  PersonSearchProtocols.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

protocol PersonSearchViewInterface: class {
    func setupInitialView()
    func reloadData(personViewModels: [PersonViewModel])
}

protocol PersonSearchPresenterInterface: class {
    func notifyViewLoaded()
    func personsFetchedFailed(withError: String)
    func personsFetched(persons: [People])
    func getPersons(name: String)
    func showPersonDetail(person: PersonViewModel)
}

protocol PersonSearchInteractorInterface {
    func fetchPersons(name: String)
}

protocol PersonSearchRouterInterface {
    func presentPersonDetail(forPerson: PersonViewModel)
}
