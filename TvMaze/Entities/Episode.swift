//
//  Episode.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 14/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation

struct Episode: Codable {
    let name: String
    let season, number: Int
    let image: Image?

}
