//
//  ShowDetailInteractor.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 09/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

class ShowDetailInteractor: ShowDetailInteractorInterface {
    
    weak var presenter: ShowDetailPresenterInterface?
    var showRepository: ShowsReposotory?
    
    init(showRepository: ShowsReposotory) {
        self.showRepository = showRepository
    }
    
    func getEpisodesFromShow(showId: Int) {
        showRepository?.getEpisodesFromShow(id: showId)
            .done { (episodes: [Episode]) in
                self.presenter?.showEpisodesFetched(episodes: episodes)
        }
            
        .catch { _ in
            self.presenter?.showEpisodesFetchedFailed()
        }
    }
    
}
