//
//  ShowsDataManger.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 08/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import PromiseKit

class ShowsReposotory: ShowRepositoryProtocol {
    
    func getShows() -> Promise<[Show]> {
       return APIClient.executeRequest(request: APIRouter.shows)
    }
    
    func getEpisodesFromShow(id: Int) -> Promise<[Episode]> {
        return APIClient.executeRequest(request: APIRouter.episodesFromShow(id: id))
    }
    
}





