//
//  TvMazeTests
//
//  Created by Fabrizio Sposetti on 15/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import Foundation
import PromiseKit
@testable import TvMaze

class MockShowRepository: ShowsReposotory {
    
    override func getShows() -> Promise<[Show]> {
        return Promise.value([
            createShow()
        ])
    }
    
    func createShow() -> Show {
        return Show(id: 1, url: "", name: "Arrow", image: Image(medium: "", original: ""), type: "Scrypted", status: "Ended", language: "English", summary: "")
    }
    
    override func getEpisodesFromShow(id: Int) -> Promise<[Episode]> {
        return Promise.value([
                   createEiposode()
               ])
    }
    
    func createEiposode() -> Episode {
        return Episode(name: "Pilot", season: 1, number: 1, image: nil)
        
    }
    
}
