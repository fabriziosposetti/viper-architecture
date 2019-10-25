//
//  ShowModel.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 08/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.


import Foundation

struct Show: Codable {
    let id: Int
    let url: String
    let name: String
    let image: Image
    let type: String
    let status: String
    let language: String
    let summary: String
}


