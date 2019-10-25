
class ShowListInteractor {
    
    weak var presenter: ShowsListPresenterInterface?
    var showRepository: ShowsReposotory?
    
    init(showRepository: ShowsReposotory) {
        self.showRepository = showRepository
    }
    
}

extension ShowListInteractor: ShowsListInteractorInterface {
    
    func fetchShowList() {
        showRepository?.getShows()
        .done { (shows: [Show]) in
            self.presenter?.showListFetched(showList: shows)
        }
            
        .catch { error in
            self.presenter?.showListFetchFailed(with: error.localizedDescription)
        }
    }
    
}
