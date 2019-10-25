//
//  TvMazeTests.swift
//  TvMazeTests
//
//  Created by Fabrizio Sposetti on 11/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import XCTest
import PromiseKit
@testable import TvMaze

class ShowListTests: XCTestCase {
    
    let view = ShowListView()
    let interactor = ShowListInteractor(showRepository: MockShowRepository())
    let router = ShowListRouter()
    let presenter = ShowListPresenter()
    
    override func setUp() {
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        view.title = "Shows"
        interactor.presenter = presenter
        router.viewController = view
        
        view.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShowsCount() {
        //arrange
        let expectation = XCTestExpectation(description: "Shows count is 1")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay) {
            expectation.fulfill()
            XCTAssertEqual(self.view.showViewModels.count, 1)
        }
        
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testShowCellInfo() {
        //arrange
        let expectation = XCTestExpectation(description: "Name should be Arrow")
        
        //act
        
        //assert
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            expectation.fulfill()
            guard let showCell = self.view.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ShowTableViewCell else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(showCell.lblShowTitle.text, "Arrow")
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    func testShowCellTapped() {
        //arrange
        let expectation = XCTestExpectation(description: "Show detail is pushed")
        let navigationController = MockNavigationController(rootViewController: view)
        
        //act
        DispatchQueue.main.asyncAfter(deadline: TestConstants.delay, execute: {
            self.view.tableView(self.view.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
            
            //assert
            expectation.fulfill()
            XCTAssertTrue(navigationController.pushedViewController is ShowDetailView)
        })
        
        wait(for: [expectation], timeout: TestConstants.timeout)
    }
    
    
}


