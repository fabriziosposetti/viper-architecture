//
//  DetailShowTests.swift
//  TvMazeTests
//
//  Created by Fabrizio Sposetti on 15/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TvMaze

class DetailShowTests: XCTestCase {
    
    let view = ShowDetailView()
    let mockShowRepository = MockShowRepository()
    let router = ShowDetailRouter()
    let presenter = ShowDetailPresenter()
    
    
    override func setUp() {
        let interactor = ShowDetailInteractor(showRepository: mockShowRepository)
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.show = mockShowRepository.createShow()
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        view.loadViewIfNeeded()
    }
    
    
    func testLabelsInfoFirstEpisode() {
        //arrange
        let expectation = XCTestExpectation(description: "Name should be Pilot, season and number should be 1")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            guard let episodeCell = self.view.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? EpisodeTableViewCell else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(episodeCell.lblNameEpisode.text, "Pilot")
            XCTAssertEqual(episodeCell.lblSeasonEpisode.text, "1")
            XCTAssertEqual(episodeCell.lblNumberEpisode.text, "1")
            
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testEpisodesCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Episodes count is 1")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay) {
            expectation.fulfill()
            XCTAssertEqual(self.view.episodesViewModel.count, 1)
        }
        
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testLabelsInfoShowDetail() {
        //arrange
        let expectation = XCTestExpectation(description: "")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            
            XCTAssertEqual(self.view.lblShowTitle.text, "Arrow")
            XCTAssertEqual(self.view.lblShowTypeValue.text, "Scrypted")
            XCTAssertEqual(self.view.lblShowStatusValue.text, "Ended")
            XCTAssertEqual(self.view.lblShowLanguageValue.text, "English")
            
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    
}

