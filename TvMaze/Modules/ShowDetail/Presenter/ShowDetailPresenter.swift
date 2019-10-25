//
//  ShowDetailPresenter.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 09/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import UIKit

typealias EpisodeViewModel = (name: String, season: String, number: String, imagen: Image?)

class ShowDetailPresenter: ShowDetailPresenterInterface {
    
    weak var view: ShowDetailViewInterface?
    var interactor: ShowDetailInteractorInterface?
    var router: ShowDetailRouterInterface?
    var show: Show?
    
    
    func notifyViewLoaded() {
        if let show = show {
            view?.setupInitialView()
            view?.showLoading()
            interactor?.getEpisodesFromShow(showId: Int(show.id))
        }
    }
    
    func showEpisodesFetched(episodes: [Episode]) {
        showDetailShowInformation()
        var episodeViewModels = [EpisodeViewModel]()
        for episode in episodes {
            let episodeViewModel: EpisodeViewModel = (episode.name, "\(episode.season)", "\(episode.number)", episode.image)
            episodeViewModels.append(episodeViewModel)
        }
        view?.hideLoading()
        view?.reloadData(episodes: episodeViewModels)
    }
    
    func showDetailShowInformation() {
        guard let show = show else { return }
        let showViewModel: ShowViewModel = (show.name, "\(show.id)", show.image, show.type, show.summary, show.language, show.status)
        view?.showDetailShowInformation(forShow: showViewModel)
    }
    
    
    func showEpisodesFetchedFailed() {
        view?.showErrorAlert()
    }
    
}
