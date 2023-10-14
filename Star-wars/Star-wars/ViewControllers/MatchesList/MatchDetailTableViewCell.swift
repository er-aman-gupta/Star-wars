//
//  MatchDetailTableViewCell.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import UIKit

final class MatchDetailTableViewCell: UITableViewCell {

    let stackView = UIStackView()
    let player1Label = UILabel()
    let player2Label = UILabel()
    let scoreLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        selectionStyle = .none
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])

        player1Label.font = UIFont.preferredFont(forTextStyle: .body)
        player2Label.font = UIFont.preferredFont(forTextStyle: .body)
        player2Label.textAlignment = .right
        scoreLabel.font = UIFont.preferredFont(forTextStyle: .body)
        scoreLabel.textAlignment = .center

        stackView.addArrangedSubview(player1Label)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(player2Label)
    }

    func setupView(with match: MatchesModel, playerId: Int) {
        player1Label.text = "Player - \(match.player1.id)"
        player2Label.text = "Player - \(match.player2.id)"
        let score = "\(match.player1.score) - \(match.player2.score)"
        scoreLabel.text = score

        if match.wasTied {
            backgroundColor = .white
        } else {
            if playerId == match.player1.id {
                if match.didPlayer1Win {
                    backgroundColor = .green
                } else {
                    backgroundColor = .red
                }
            } else {
                if match.didPlayer1Win {
                    backgroundColor = .red
                } else {
                    backgroundColor = .green
                }
            }

        }
    }
}
