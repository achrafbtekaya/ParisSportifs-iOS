//
//  NetworkRequestsTests.swift
//  ParisSportifsTests
//
//  Created by Achref Ben Tekaya on 5/10/2023.
//

import XCTest
@testable import ParisSportifs

final class NetworkRequestsTests: XCTestCase {

    func testFetchLeagues() {
        let expectation = XCTestExpectation(description: "Fetch all leagues API")
        LeagueService.getLeagues { result in
            guard let leagues = result else {
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertEqual(leagues.count, 1006)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchTeamsByLeague() {
        let expectation = XCTestExpectation(description: "Fetch French Ligue 1 teams API")
        TeamService.getTeams(leagueName: "French Ligue 1") { result in
            guard let teams = result else {
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertEqual(teams.count, 18)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

}
