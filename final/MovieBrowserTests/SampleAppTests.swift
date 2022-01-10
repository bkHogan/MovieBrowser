//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class SampleAppTests: XCTestCase {
    
    var fakeNetworkManager = FakeNetwork()
    var viewModel: SearchViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = SearchViewModel(networkManager: fakeNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchByName() throws {
        // Given
        let data = try load(json: "movies")
        fakeNetworkManager.data = data
        let expectation = expectation(description: "waiting...")
        
        // When
        viewModel
            .refreshMoviesList = { [weak self] in
                expectation.fulfill()
                XCTAssertEqual(self?.viewModel.movies.count, 20)
            }
        viewModel.search(by: "")
        
        // Then
        waitForExpectations(timeout: 1.0)
        
    }
    
    private func load(json: String) throws -> Data {
        let bundle = Bundle(for: SampleAppTests.self)
        guard let file = bundle.url(forResource: json, withExtension: "json")
        else {
            fatalError()
        }
        return try Data(contentsOf: file)
    }

}
