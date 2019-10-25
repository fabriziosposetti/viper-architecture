import Foundation
import UIKit

// ShowListPresenter -> ShowListView
protocol ShowsListViewInterface: class {
    var presenter: ShowsListPresenterInterface? { get set }
    
    func showLoading()
    func hideLoading()
    func reloadData(showViewModels: [ShowViewModel])
    func setupInitialView()
}

protocol ShowsListPresenterInterface: class {
    // ShowListView -> ShowListPresenter
    func notifyViewLoaded()
    func showDetailShow(show: ShowViewModel)
    
    // ShowListInteractor -> ShowListPresenter
    func showListFetched(showList:[Show])
    func showListFetchFailed(with errorMessage:String)
}

protocol ShowsListInteractorInterface {
    // ShowListPresenter -> ShowListInteractor
    func fetchShowList()
}


protocol ShowListRouterInterface {
    // ShowListPresenter -> ShowListRouter
    func presentDetailShowScreen(forShow show: ShowViewModel)

}
