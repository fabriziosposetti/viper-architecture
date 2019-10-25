import UIKit

class MazeModule {
    
    static func createTabBarModule(usingSubModules submodules: TabBarRouter.Submdoules) -> UITabBarController {
        
        let tabs = TabBarRouter.tabs(usingSubModules: submodules)
        let tabBarController = MazeTabBarController(tabs: tabs)
        
        return tabBarController
    }
    
    static func createListShowModule(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = ShowListView()
        let interactor = ShowListInteractor(showRepository: ShowsReposotory())
        let router = ShowListRouter()
        let presenter = ShowListPresenter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
                
        return factory(view)
    }
    
    static func createShowDetailModule(forShow show: Show) -> UIViewController {
        let view = ShowDetailView(nibName: "ShowDetailView", bundle: nil) as ShowDetailView
        let interactor = ShowDetailInteractor(showRepository: ShowsReposotory())
        let router = ShowDetailRouter()
        let presenter = ShowDetailPresenter()
        
        presenter.view = view
        presenter.show = show
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    static func createPersonSearchModule(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = PersonSearchViewController()
        let interactor = PersonSearchInteractor(personRepository: PersonRepository())
        let router = PersonSearchRouter()
        let presenter = PersonSearchPresenter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
                
        return factory(view)
    }
    
    static func createPersonDetailModule(forPerson person: PersonViewModel) -> UIViewController {
        let view = PersonDetailView(nibName: "PersonDetailView", bundle: nil) as PersonDetailView
        let interactor = PersonDetailInteractor(personRepository: PersonRepository())
        let router = PersonDetailRouter()
        let presenter = PersonDetailPresenter()
        
        presenter.view = view
        presenter.person = person
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}
