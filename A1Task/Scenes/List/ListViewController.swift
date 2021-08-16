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
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor,
                         bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListViewController: ListViewControllerActions {
    func reloadTableView() {
        tableView.reloadData()
    }
}
