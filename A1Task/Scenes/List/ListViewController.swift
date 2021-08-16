//
//  ListViewController.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit

protocol ListViewControllerActions: AnyObject {}

final class ListViewController: UIViewController {

    var viewModel: ListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .purple
    }
}

extension ListViewController: ListViewControllerActions {}
