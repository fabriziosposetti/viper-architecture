//
//  Protocols.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 09/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import UIKit

// ShowDetailPresenter -> ShowDetailView
protocol ShowDetailViewInterface: class {
    var presenter: ShowDetailPresenterInterface? { get set }
    
    func showLoading()
    func hideLoading()
    func showErrorAlert()
    func setupInitialView()
    func reloadData(episodes: [EpisodeViewModel])
    func showDetailShowInformation(forShow show: ShowViewModel)
}

// ShowDetailView -> ShowDetailPresenter
protocol ShowDetailPresenterInterface: class {
    func notifyViewLoaded()
    func showEpisodesFetched(episodes: [Episode])
    func showEpisodesFetchedFailed()
}

// ShowDetailPresenter -> ShowDetailInteractor
protocol ShowDetailInteractorInterface {
    func getEpisodesFromShow(showId: Int)
}

// ShowDetailPresenter -> ShowDetailRouter
protocol ShowDetailRouterInterface {
    
}


