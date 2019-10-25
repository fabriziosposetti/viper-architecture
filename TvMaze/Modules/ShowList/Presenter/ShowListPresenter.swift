
typealias ShowViewModel = (name: String, id: String,
imagen: Image, type: String,
summary: String, language: String, status: String)

class ShowListPresenter {

    weak var view: ShowsListViewInterface?
    var interactor: ShowsListInteractorInterface?
    var router: ShowListRouterInterface?
    
}

extension ShowListPresenter: ShowsListPresenterInterface {

    func notifyViewLoaded() {
        view?.setupInitialView()
        view?.showLoading()
        interactor?.fetchShowList()
    }
    
    
    func showListFetched(showList: [Show]) {
        var showViewModels = [ShowViewModel]()
        for show in showList {
            let showViewModel: ShowViewModel = (show.name, "\(show.id)", show.image, show.type, show.summary, show.language, show.status)
            showViewModels.append(showViewModel)
        }
        view?.hideLoading()
        view?.reloadData(showViewModels: showViewModels)
    }
    
    
    func showListFetchFailed(with errorMessage: String) {
        print("showListFetchFailed")
    }
    
    func showDetailShow(show: ShowViewModel) {
        router?.presentDetailShowScreen(forShow: show)
    }
    
    
}

