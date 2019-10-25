//
//  EpisodeTableViewCell.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 14/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameEpisode: UILabel!
    @IBOutlet weak var lblSeasonEpisode: UILabel!
    @IBOutlet weak var lblNumberEpisode: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
        
    func set(episode: EpisodeViewModel) {
        lblNameEpisode.text = episode.name
        lblSeasonEpisode.text = episode.season
        lblNumberEpisode.text = episode.number
        KingFisherHelper.setImageFrom(url: episode.imagen?.medium, in: episodeImage, withPlaceholder: UIImage(named: "show-icon")!)
    }

    
}
