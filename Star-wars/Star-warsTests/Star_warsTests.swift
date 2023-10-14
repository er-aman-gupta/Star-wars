//
//  Star_warsTests.swift
//  Star-warsTests
//
//  Created by Aman Gupta on 14/10/23.
//

import XCTest
@testable import Star_wars

final class Star_warsTests: XCTestCase {

    var viewModel: PlayersListViewControllerViewModel!
    let matches = [MatchesModel(match: 1, player1: PlayersModel(id: 1, score: 93, totalScore: 0, points: 0), player2: PlayersModel(id: 2, score: 83, totalScore: 0, points: 0)), MatchesModel(match: 2, player1: PlayersModel(id: 3, score: 89, totalScore: 0, points: 0), player2: PlayersModel(id: 4, score: 90, totalScore: 0, points: 0)), MatchesModel(match: 3, player1: PlayersModel(id: 5, score: 97, totalScore: 0, points: 0), player2: PlayersModel(id: 6, score: 92, totalScore: 0, points: 0)), MatchesModel(match: 4, player1: PlayersModel(id: 7, score: 87, totalScore: 0, points: 0), player2: PlayersModel(id: 8, score: 90, totalScore: 0, points: 0)), MatchesModel(match: 5, player1: PlayersModel(id: 9, score: 91, totalScore: 0, points: 0), player2: PlayersModel(id: 10, score: 82, totalScore: 0, points: 0)), MatchesModel(match: 6, player1: PlayersModel(id: 11, score: 91, totalScore: 0, points: 0), player2: PlayersModel(id: 12, score: 89, totalScore: 0, points: 0)), MatchesModel(match: 7, player1: PlayersModel(id: 10, score: 99, totalScore: 0, points: 0), player2: PlayersModel(id: 11, score: 93, totalScore: 0, points: 0)), MatchesModel(match: 8, player1: PlayersModel(id: 9, score: 87, totalScore: 0, points: 0), player2: PlayersModel(id: 8, score: 90, totalScore: 0, points: 0)), MatchesModel(match: 9, player1: PlayersModel(id: 1, score: 86, totalScore: 0, points: 0), player2: PlayersModel(id: 12, score: 97, totalScore: 0, points: 0)), MatchesModel(match: 10, player1: PlayersModel(id: 4, score: 82, totalScore: 0, points: 0), player2: PlayersModel(id: 5, score: 86, totalScore: 0, points: 0)), MatchesModel(match: 11, player1: PlayersModel(id: 7, score: 96, totalScore: 0, points: 0), player2: PlayersModel(id: 6, score: 85, totalScore: 0, points: 0)), MatchesModel(match: 12, player1: PlayersModel(id: 2, score: 96, totalScore: 0, points: 0), player2: PlayersModel(id: 3, score: 86, totalScore: 0, points: 0)), MatchesModel(match: 13, player1: PlayersModel(id: 3, score: 89, totalScore: 0, points: 0), player2: PlayersModel(id: 5, score: 99, totalScore: 0, points: 0)), MatchesModel(match: 14, player1: PlayersModel(id: 12, score: 97, totalScore: 0, points: 0), player2: PlayersModel(id: 2, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 15, player1: PlayersModel(id: 8, score: 100, totalScore: 0, points: 0), player2: PlayersModel(id: 10, score: 88, totalScore: 0, points: 0)), MatchesModel(match: 16, player1: PlayersModel(id: 9, score: 91, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 83, totalScore: 0, points: 0)), MatchesModel(match: 17, player1: PlayersModel(id: 1, score: 94, totalScore: 0, points: 0), player2: PlayersModel(id: 11, score: 99, totalScore: 0, points: 0)), MatchesModel(match: 18, player1: PlayersModel(id: 6, score: 91, totalScore: 0, points: 0), player2: PlayersModel(id: 4, score: 86, totalScore: 0, points: 0)), MatchesModel(match: 19, player1: PlayersModel(id: 4, score: 92, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 90, totalScore: 0, points: 0)), MatchesModel(match: 20, player1: PlayersModel(id: 5, score: 86, totalScore: 0, points: 0), player2: PlayersModel(id: 1, score: 80, totalScore: 0, points: 0)), MatchesModel(match: 21, player1: PlayersModel(id: 6, score: 92, totalScore: 0, points: 0), player2: PlayersModel(id: 3, score: 85, totalScore: 0, points: 0)), MatchesModel(match: 22, player1: PlayersModel(id: 2, score: 96, totalScore: 0, points: 0), player2: PlayersModel(id: 10, score: 91, totalScore: 0, points: 0)), MatchesModel(match: 23, player1: PlayersModel(id: 12, score: 98, totalScore: 0, points: 0), player2: PlayersModel(id: 9, score: 91, totalScore: 0, points: 0)), MatchesModel(match: 24, player1: PlayersModel(id: 8, score: 100, totalScore: 0, points: 0), player2: PlayersModel(id: 11, score: 85, totalScore: 0, points: 0)), MatchesModel(match: 25, player1: PlayersModel(id: 10, score: 90, totalScore: 0, points: 0), player2: PlayersModel(id: 12, score: 91, totalScore: 0, points: 0)), MatchesModel(match: 26, player1: PlayersModel(id: 1, score: 89, totalScore: 0, points: 0), player2: PlayersModel(id: 3, score: 82, totalScore: 0, points: 0)), MatchesModel(match: 27, player1: PlayersModel(id: 8, score: 97, totalScore: 0, points: 0), player2: PlayersModel(id: 6, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 28, player1: PlayersModel(id: 9, score: 95, totalScore: 0, points: 0), player2: PlayersModel(id: 11, score: 86, totalScore: 0, points: 0)), MatchesModel(match: 29, player1: PlayersModel(id: 2, score: 83, totalScore: 0, points: 0), player2: PlayersModel(id: 4, score: 84, totalScore: 0, points: 0)), MatchesModel(match: 30, player1: PlayersModel(id: 7, score: 87, totalScore: 0, points: 0), player2: PlayersModel(id: 5, score: 80, totalScore: 0, points: 0)), MatchesModel(match: 31, player1: PlayersModel(id: 12, score: 89, totalScore: 0, points: 0), player2: PlayersModel(id: 3, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 32, player1: PlayersModel(id: 4, score: 95, totalScore: 0, points: 0), player2: PlayersModel(id: 9, score: 95, totalScore: 0, points: 0)), MatchesModel(match: 33, player1: PlayersModel(id: 2, score: 82, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 91, totalScore: 0, points: 0)), MatchesModel(match: 34, player1: PlayersModel(id: 11, score: 88, totalScore: 0, points: 0), player2: PlayersModel(id: 6, score: 85, totalScore: 0, points: 0)), MatchesModel(match: 35, player1: PlayersModel(id: 8, score: 88, totalScore: 0, points: 0), player2: PlayersModel(id: 5, score: 81, totalScore: 0, points: 0)), MatchesModel(match: 36, player1: PlayersModel(id: 10, score: 90, totalScore: 0, points: 0), player2: PlayersModel(id: 1, score: 89, totalScore: 0, points: 0)), MatchesModel(match: 37, player1: PlayersModel(id: 2, score: 80, totalScore: 0, points: 0), player2: PlayersModel(id: 8, score: 93, totalScore: 0, points: 0)), MatchesModel(match: 38, player1: PlayersModel(id: 6, score: 88, totalScore: 0, points: 0), player2: PlayersModel(id: 10, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 39, player1: PlayersModel(id: 4, score: 87, totalScore: 0, points: 0), player2: PlayersModel(id: 1, score: 82, totalScore: 0, points: 0)), MatchesModel(match: 40, player1: PlayersModel(id: 5, score: 97, totalScore: 0, points: 0), player2: PlayersModel(id: 9, score: 83, totalScore: 0, points: 0)), MatchesModel(match: 41, player1: PlayersModel(id: 11, score: 90, totalScore: 0, points: 0), player2: PlayersModel(id: 3, score: 94, totalScore: 0, points: 0)), MatchesModel(match: 42, player1: PlayersModel(id: 12, score: 85, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 89, totalScore: 0, points: 0)), MatchesModel(match: 43, player1: PlayersModel(id: 9, score: 86, totalScore: 0, points: 0), player2: PlayersModel(id: 1, score: 83, totalScore: 0, points: 0)), MatchesModel(match: 44, player1: PlayersModel(id: 7, score: 99, totalScore: 0, points: 0), player2: PlayersModel(id: 11, score: 87, totalScore: 0, points: 0)), MatchesModel(match: 45, player1: PlayersModel(id: 3, score: 81, totalScore: 0, points: 0), player2: PlayersModel(id: 10, score: 96, totalScore: 0, points: 0)), MatchesModel(match: 46, player1: PlayersModel(id: 6, score: 97, totalScore: 0, points: 0), player2: PlayersModel(id: 12, score: 92, totalScore: 0, points: 0)), MatchesModel(match: 47, player1: PlayersModel(id: 5, score: 85, totalScore: 0, points: 0), player2: PlayersModel(id: 2, score: 87, totalScore: 0, points: 0)), MatchesModel(match: 48, player1: PlayersModel(id: 4, score: 95, totalScore: 0, points: 0), player2: PlayersModel(id: 8, score: 87, totalScore: 0, points: 0)), MatchesModel(match: 49, player1: PlayersModel(id: 11, score: 91, totalScore: 0, points: 0), player2: PlayersModel(id: 4, score: 96, totalScore: 0, points: 0)), MatchesModel(match: 50, player1: PlayersModel(id: 2, score: 92, totalScore: 0, points: 0), player2: PlayersModel(id: 6, score: 99, totalScore: 0, points: 0)), MatchesModel(match: 51, player1: PlayersModel(id: 12, score: 95, totalScore: 0, points: 0), player2: PlayersModel(id: 5, score: 93, totalScore: 0, points: 0)), MatchesModel(match: 52, player1: PlayersModel(id: 8, score: 85, totalScore: 0, points: 0), player2: PlayersModel(id: 1, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 53, player1: PlayersModel(id: 10, score: 83, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 82, totalScore: 0, points: 0)), MatchesModel(match: 54, player1: PlayersModel(id: 3, score: 96, totalScore: 0, points: 0), player2: PlayersModel(id: 9, score: 92, totalScore: 0, points: 0)), MatchesModel(match: 55, player1: PlayersModel(id: 11, score: 81, totalScore: 0, points: 0), player2: PlayersModel(id: 2, score: 82, totalScore: 0, points: 0)), MatchesModel(match: 56, player1: PlayersModel(id: 1, score: 98, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 57, player1: PlayersModel(id: 6, score: 96, totalScore: 0, points: 0), player2: PlayersModel(id: 9, score: 84, totalScore: 0, points: 0)), MatchesModel(match: 58, player1: PlayersModel(id: 12, score: 94, totalScore: 0, points: 0), player2: PlayersModel(id: 4, score: 83, totalScore: 0, points: 0)), MatchesModel(match: 59, player1: PlayersModel(id: 3, score: 99, totalScore: 0, points: 0), player2: PlayersModel(id: 8, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 60, player1: PlayersModel(id: 5, score: 92, totalScore: 0, points: 0), player2: PlayersModel(id: 10, score: 86, totalScore: 0, points: 0)), MatchesModel(match: 61, player1: PlayersModel(id: 8, score: 87, totalScore: 0, points: 0), player2: PlayersModel(id: 12, score: 92, totalScore: 0, points: 0)), MatchesModel(match: 62, player1: PlayersModel(id: 11, score: 85, totalScore: 0, points: 0), player2: PlayersModel(id: 5, score: 97, totalScore: 0, points: 0)), MatchesModel(match: 63, player1: PlayersModel(id: 10, score: 84, totalScore: 0, points: 0), player2: PlayersModel(id: 4, score: 100, totalScore: 0, points: 0)), MatchesModel(match: 64, player1: PlayersModel(id: 3, score: 80, totalScore: 0, points: 0), player2: PlayersModel(id: 7, score: 93, totalScore: 0, points: 0)), MatchesModel(match: 65, player1: PlayersModel(id: 6, score: 87, totalScore: 0, points: 0), player2: PlayersModel(id: 1, score: 98, totalScore: 0, points: 0)), MatchesModel(match: 66, player1: PlayersModel(id: 9, score: 96, totalScore: 0, points: 0), player2: PlayersModel(id: 2, score: 95, totalScore: 0, points: 0))]

    override func setUpWithError() throws {
        viewModel = PlayersListViewControllerViewModel()
    }

    func testSortPlayers() {
        let players = [PlayersModel(id: 1,
                                    score: 10,
                                    totalScore: 180,
                                    points: 30),
                       PlayersModel(id: 2,
                                    score: 10,
                                    totalScore: 180,
                                    points: 100),
                       PlayersModel(id: 5,
                                    score: 10,
                                    totalScore: 180,
                                    points: 50),
                       PlayersModel(id: 3,
                                    score: 10,
                                    totalScore: 280,
                                    points: 90),
                       PlayersModel(id: 4,
                                    score: 10,
                                    totalScore: 190,
                                    points: 50)]
        viewModel.players = players
        viewModel.sortPlayers()

        XCTAssertEqual(viewModel.players[0].id, 2)
        XCTAssertEqual(viewModel.players[1].id, 3)
        XCTAssertEqual(viewModel.players[2].id, 4)
        XCTAssertEqual(viewModel.players[3].id, 5)
        XCTAssertEqual(viewModel.players[4].id, 1)
    }


    func testGetMatchesOfPlayer() {
        viewModel.matches = matches

        let matchesOfPlayer = viewModel.getMatchesOfPlayer(withId: 3)
        XCTAssertEqual(matchesOfPlayer.count, 11)
    }

    func testSetupPlayers() {
        viewModel.matches = matches

        viewModel.setupPlayers(matches)

        let topPlayer = viewModel.players[0]
        XCTAssertEqual(topPlayer.id, 3)
        XCTAssertEqual(topPlayer.score, 89)
        XCTAssertEqual(topPlayer.totalScore, 990)
        XCTAssertEqual(topPlayer.points, 22)
    }
}
