//
//  Person.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation


struct People: Codable {
    let score: Double?
    let person: PersonInformation?
}

// MARK: - PersonClass
struct PersonInformation: Codable {
    let id: Int?
    let url: String?
    let name: String?
    let gender: String?
    let image: Image?
    let country: Country?
    let birthday: String?
}


