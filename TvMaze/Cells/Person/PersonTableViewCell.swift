//
//  PersonTableViewCell.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 17/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
        
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    
    func setCell(person: PersonViewModel) {
        lblPersonName.text = person.name
        lblCountryName.text = person.countryName
        KingFisherHelper.setImageFrom(url: person.imagen?.medium, in: personImage, withPlaceholder: UIImage(named: "person-icon")!)
    }
    
    
}
