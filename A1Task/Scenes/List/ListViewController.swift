//
//  ListViewController.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

protocol ListViewControllerActions: AnyObject {
    func reloadTableView()
}

final class ListViewController: UIViewController {

    var viewModel: ListViewModel!

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureUI()
    }

    private func configureUI() {
        title = "Murlocs"
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor,
                         bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
}

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

extension ListViewController: ListViewControllerActions {
    func reloadTableView() {
        tableView.reloadData()
    }
}
