//
//  PlayersListViewControllerViewModel.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import Foundation

protocol PlayersListViewControllerViewModelDelegate: AnyObject {
    func dataFetched()
}

final class PlayersListViewControllerViewModel {

    let matchesService = MatchesService()
    var matches: [MatchesModel] = []
    var players: [PlayersModel] = []

    weak var delegate: PlayersListViewControllerViewModelDelegate?

    func getMatches() {
        matchesService.getMatches { [weak self] result in
            switch result {
            case .success(let matches):
                self?.matches = matches
                debugPrint(matches)
                self?.setupPlayers(matches)
                self?.delegate?.dataFetched()
            case .failure(let error):
                debugPrint("Failed to get matches. \(error.localizedDescription)")
            }
        }
    }

    func setupPlayers(_ matches: [MatchesModel]) {
        var playerIdPlayerMap: [Int: PlayersModel] = [:]
        matches.forEach { match in
            let player1 = match.player1
            let player2 = match.player2
            // Add players to map
            if playerIdPlayerMap[player1.id] == nil {
                playerIdPlayerMap[player1.id] = player1
            }
            if playerIdPlayerMap[player2.id] == nil {
                playerIdPlayerMap[player2.id] = player1
            }
            if var player1Obj = playerIdPlayerMap[player1.id] {
                player1Obj.totalScore += player1.score
                if match.wasTied {
                    player1Obj.points += 1
                } else if match.didPlayer1Win {
                    player1Obj.points += 3
                }
                playerIdPlayerMap[player1.id] = player1Obj
            }
            if var player2Obj = playerIdPlayerMap[player2.id] {
                player2Obj.totalScore += player2.score
                if match.wasTied {
                    player2Obj.points += 1
                } else if !match.didPlayer1Win {
                    player2Obj.points += 3
                }
                playerIdPlayerMap[player2.id] = player2Obj
            }
        }
        players = playerIdPlayerMap.map({$0.value})
        debugPrint(players)
        sortPlayers()
    }

    func sortPlayers() {
        players.sort { player1, player2 in
            if player1.points == player2.points {
                return player1.totalScore > player2.totalScore
            } else {
                return player1.points > player2.points
            }
        }
        debugPrint("Sorted")
        debugPrint(players)
    }

    func getMatchesOfPlayer(withId id: Int) -> [MatchesModel] {
        matches.filter { match in
            match.player1.id == id || match.player2.id == id
        }
    }
}
