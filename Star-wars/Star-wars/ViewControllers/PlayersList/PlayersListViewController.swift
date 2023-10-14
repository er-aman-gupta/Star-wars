//
//  PlayersListViewController.swift
//  Star-wars
//
//  Created by Aman Gupta on 14/10/23.
//

import UIKit

final class PlayersListViewController: UIViewController {
    
    let viewModel = PlayersListViewControllerViewModel()

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getMatches()

        view.backgroundColor = .white
        self.title = "Star Wars Blaster Tournament"

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        tableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: "PlayersTableViewCell")
    }

}

extension PlayersListViewController: PlayersListViewControllerViewModelDelegate {
    func dataFetched() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PlayersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersTableViewCell", for: indexPath) as? PlayersTableViewCell
        else { return UITableViewCell() }
        cell.setupView(with: viewModel.players[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerId = viewModel.players[indexPath.row].id
        let matches = viewModel.getMatchesOfPlayer(withId: playerId)
        let matchListViewController = MatchesListViewController(playerId: playerId,
                                                                matches: matches)
        self.navigationController?.pushViewController(matchListViewController, animated: true)

    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.players.isEmpty ? 44 : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Points Table"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        return view
    }
}
