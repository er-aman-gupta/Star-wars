//
//  MatchesModel.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import Foundation

struct MatchesModel: Codable {
    let match: Int
    let player1: PlayersModel
    let player2: PlayersModel

    var wasTied: Bool {
        player1.score == player2.score
    }
    
    var didPlayer1Win: Bool {
        player1.score > player2.score
    }
}


struct PlayersModel: Codable {
    let id: Int
    let score: Int
    var totalScore: Int = 0
    var points: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, score
    }
}
