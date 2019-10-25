//
//  PersonSearchViewController.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 16/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class PersonSearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var persons: [PersonViewModel] = []
    var presenter: PersonSearchPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
    }

}

extension PersonSearchViewController: PersonSearchViewInterface {
    
    func setupInitialView() {
        self.title = Text.SearchPeople.description
        configureSearchBar()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(PersonTableViewCell.self)
        tableView.separatorColor = UIColor.black
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    
    func reloadData(personViewModels: [PersonViewModel]) {
        self.persons = personViewModels
        tableView.reloadData()
    }
    
}


extension PersonSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PersonTableViewCell
        let person = persons[indexPath.row]
        cell.setCell(person: person)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPersonDetail(person: persons[indexPath.row])
    }
    
}

extension PersonSearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.getPersons(name: searchText)
    }
    
}
