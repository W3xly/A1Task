//
//  ListViewController.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

protocol ListViewControllerActions: AnyObject {
    func reloadTableView()
    func startLoading()
    func stopLoading()
    func showError(with message: String?)
}

final class ListViewController: UIViewController {

    var viewModel: ListViewModel!

    let tableView = UITableView()

    lazy var sortingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sort", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        return button
    }()

    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.hidesWhenStopped = true
        return indicator
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureUI()
        viewModel.viewDidLoad()
    }

    // MARK: - Helpers

    private func configureUI() {
        title = "Murlocs"

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: sortingButton)

        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor,
                         bottom: view.bottomAnchor, right: view.rightAnchor)

        view.addSubview(activityIndicator)
        activityIndicator.centerX(inView: view)
        activityIndicator.centerY(inView: view)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }

    // MARK: - Selectors

    @objc func showActionSheet() {
        let alert = UIAlertController(title: "Sort by:", message: "Please choose how you would like to sort cards.", preferredStyle: .actionSheet)

        let manaAction = UIAlertAction(title: "Mana cost", style: .default) { _ in
            self.viewModel.sortBy(option: .manaCost)
        }
        let attackAction = UIAlertAction(title: "Attack", style: .default) { _ in
            self.viewModel.sortBy(option: .attack)
        }
        let healthAction = UIAlertAction(title: "Health", style: .default) { _ in
            self.viewModel.sortBy(option: .health)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        [manaAction, attackAction, healthAction, cancelAction].forEach {
            alert.addAction($0)
        }

        self.present(alert, animated: true)
    }
}

extension ListViewController: ListViewControllerActions {
    func showError(with message: String?) {
        let alert = UIAlertController(title: "Loading cards failed!",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true)
    }

    func startLoading() {
        activityIndicator.startAnimating()
    }

    func stopLoading() {
        activityIndicator.stopAnimating()
    }

    func reloadTableView() {
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}
