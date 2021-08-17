//
//  ListDataSource.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import UIKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell else { return UITableViewCell() }

        cell.selectionStyle = .none
        cell.setupCell(with: viewModel.cards[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = DetailCoordinator(type: .modal(self), inputData: DetailInputData(card: viewModel.cards[indexPath.row]))
        coordinator.start()
    }
}
