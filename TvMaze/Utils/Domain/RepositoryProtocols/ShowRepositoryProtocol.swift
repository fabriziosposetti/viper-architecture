//
//  ASD.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 08/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import PromiseKit

protocol ShowRepositoryProtocol {
    func getShows() -> Promise<[Show]>
    func getEpisodesFromShow(id: Int) -> Promise<[Episode]>
}
