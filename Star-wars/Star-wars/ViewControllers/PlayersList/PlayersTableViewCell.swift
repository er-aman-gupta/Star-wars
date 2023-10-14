//
//  PlayersTableViewCell.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import UIKit

final class PlayersTableViewCell: UITableViewCell {

    let stackView = UIStackView()
    let playerIdLabel = UILabel()
    let playerScoreLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        selectionStyle = .none
        addSubview(stackView)
        stackView.axis = .horizontal

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])

        playerIdLabel.textColor = .black
        playerScoreLabel.textColor = .black
        playerIdLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        playerScoreLabel.font = UIFont.preferredFont(forTextStyle: .headline)

        stackView.addArrangedSubview(playerIdLabel)
        stackView.addArrangedSubview(playerScoreLabel)
    }

    func setupView(with player: PlayersModel) {
        playerIdLabel.text = "Player - \(player.id)"
        playerScoreLabel.text = "\(player.points)"
    }
}

