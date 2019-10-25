import UIKit

class ShowListRouter: ShowListRouterInterface {
    
    weak var viewController: UIViewController?
    
    func presentDetailShowScreen(forShow showViewModel: ShowViewModel) {
        
        let show = Show(id: Int(showViewModel.id) ?? 0, url: "", name: showViewModel.name, image: showViewModel.imagen, type: showViewModel.type, status: showViewModel.status, language: showViewModel.language, summary: showViewModel.summary)
        let showDetailViewController = MazeModule.createShowDetailModule(forShow: show)
        
        viewController?.navigationController?.pushViewController(showDetailViewController, animated: true)
        
    }
    
}
