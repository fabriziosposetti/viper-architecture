//
//  pruebaView.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 08/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

class ShowListView: UIViewController {
    
    var presenter: ShowsListPresenterInterface?
    var showViewModels: [ShowViewModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.notifyViewLoaded()
    }
    
}

extension ShowListView: ShowsListViewInterface {
    
    func showLoading() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
    
    func setupInitialView() {
        self.title = Text.Shows.description
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(ShowTableViewCell.self)
        tableView.separatorColor = UIColor.black
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadData(showViewModels: [ShowViewModel]) {
        self.showViewModels = showViewModels
        tableView.reloadData()
    }
    
}


extension ShowListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ShowTableViewCell
        cell.set(show: showViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailShow(show: showViewModels[indexPath.row])
    }
    
}
