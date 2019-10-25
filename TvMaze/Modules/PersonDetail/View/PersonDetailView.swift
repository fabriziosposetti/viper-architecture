//
//  PersonDetailViewController.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 21/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class PersonDetailView: UIViewController {
    
    var presenter: PersonDetailPresenterInterface?
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
    }

}

extension PersonDetailView: PersonDetailViewInterface {
    
    func setupInitialView(person: PersonViewModel) {
        self.title = Text.Detail.description
        lblPersonName.text = person.name
        lblCountryName.text = person.countryName
        lblBirthday.text = person.birthday
        lblGender.text = person.gender
        KingFisherHelper.setImageFrom(url: person.imagen?.original,
                                      in: personImage,
                                      withPlaceholder: UIImage(named: "person-icon")!)
    }
    
}
