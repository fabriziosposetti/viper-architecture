//
//  ShowDetailView.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 09/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit
import Kingfisher

class ShowDetailView: UIViewController {
    
    var presenter: ShowDetailPresenterInterface?
    @IBOutlet weak var lblShowTitle: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblShowTypeValue: UILabel!
    @IBOutlet weak var lblShowTypeTitle: UILabel!
    @IBOutlet weak var lblShowLanguageTitle: UILabel!
    @IBOutlet weak var lblShowLanguageValue: UILabel!
    @IBOutlet weak var lblShowStatusTitle: UILabel!
    @IBOutlet weak var lblShowStatusValue: UILabel!
    @IBOutlet weak var lblEpisodes: UILabel!
    
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var episodesViewModel: [EpisodeViewModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
    }
    
}

extension ShowDetailView: ShowDetailViewInterface {
    
    func setupInitialView() {
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EpisodeTableViewCell.self)
        tableView.separatorColor = UIColor.black
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func showLoading() {
        showActivityIndicator(activityIndicator: activityIndicator)
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
    
    func showErrorAlert() {
        let alertViewController = UIAlertController(title: Text.Ups.description,
                                                    message: Text.ErrorAlertMessage.description,
                                                    preferredStyle: .alert)
        let alertAction = UIAlertAction(title: Text.TryAgain.description,
                                        style: .default) { [weak self]  _ in
                                            guard let strongSelf = self else { return }
                                            strongSelf.presenter?.notifyViewLoaded()
        }
        let cancelAction = UIAlertAction(title: Text.Cancel.description,
                                         style: .cancel,
                                         handler: nil)
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(alertAction)
        present(alertViewController, animated: true, completion: nil)
    }
    
    func showDetailShowInformation(forShow show: ShowViewModel) {
        self.title = show.name
        showUIElements()
        lblShowTypeValue.text = show.type
        lblShowTitle.text = show.name
        lblShowLanguageValue.text = show.language
        lblShowStatusValue.text = show.status
        KingFisherHelper.setImageFrom(url: show.imagen.medium, in: showImage, withPlaceholder: UIImage(named: "show-icon")!)
    }
    
    func showUIElements() {
        lblShowTitle.isHidden = false
        showImage.isHidden = false
        separatorView.isHidden = false
        lblShowTypeValue.isHidden = false
        lblShowTypeTitle.isHidden = false
        lblShowLanguageTitle.isHidden = false
        lblShowLanguageValue.isHidden = false
        lblShowStatusTitle.isHidden = false
        lblShowStatusValue.isHidden = false
        lblEpisodes.isHidden = false
        tableView.isHidden = false
    }
    
    func reloadData(episodes: [EpisodeViewModel]) {
        episodesViewModel = episodes
        tableView.reloadData()
    }
    
}

extension ShowDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as EpisodeTableViewCell
        cell.set(episode: episodesViewModel[indexPath.row])
        return cell
    }
    
    
}


