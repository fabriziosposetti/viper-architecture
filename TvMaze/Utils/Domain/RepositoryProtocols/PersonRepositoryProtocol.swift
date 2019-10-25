//
//  PersonRepositoryProtocol.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 18/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import PromiseKit

protocol PersonRepositoryProtocol {
    func getPersons(name: String) -> Promise<[People]>
}
