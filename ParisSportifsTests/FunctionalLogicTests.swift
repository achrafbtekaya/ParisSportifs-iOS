//
//  FunctionalLogicTests.swift
//  ParisSportifsTests
//
//  Created by Achref Ben Tekaya on 5/10/2023.
//

import XCTest
@testable import ParisSportifs

final class FunctionalLogicTests: XCTestCase {
    
    func testAntiAlphabeticalOrder() {
        let expectation = XCTestExpectation(description: "Test Sort Function")

        let teams = [
            Team(id: "123", name: "West Ham", image: "", country: "", league: "", description: "")!,
            Team(id: "345", name: "Arsenal", image: "", country: "", league: "", description: "")!,
            Team(id: "456", name: "Leicester", image: "", country: "", league: "", description: "")!,
        ]
        
        let viewModel = HomeViewModel(shouldCallAPI: false)
        let result = viewModel.sortTeamsList(teams: teams)
        
        let expected = [
            Team(id: "123", name: "West Ham", image: "", country: "", league: "", description: ""),
            Team(id: "456", name: "Leicester", image: "", country: "", league: "", description: ""),
            Team(id: "345", name: "Arsenal", image: "", country: "", league: "", description: ""),
        ]
        
        XCTAssertEqual(result, expected)
        expectation.fulfill()
    }

    func testkeepOneItemOutOfTwo() throws {
        let expectation = XCTestExpectation(description: "Test Keep One Out of Two Function")

        let teams = [
            Team(id: "123", name: "West Ham", image: "", country: "", league: "", description: "")!,
            Team(id: "345", name: "Arsenal", image: "", country: "", league: "", description: "")!,
            Team(id: "456", name: "Leicester", image: "", country: "", league: "", description: "")!,
        ]
        
        let viewModel = HomeViewModel(shouldCallAPI: false)
        let result = viewModel.keepOneTeamOutOfTwo(teams: teams)
        
        let expected = [
            Team(id: "123", name: "West Ham", image: "", country: "", league: "", description: ""),
            Team(id: "456", name: "Leicester", image: "", country: "", league: "", description: ""),
        ]
        
        XCTAssertEqual(result, expected)
        expectation.fulfill()
    }

}
