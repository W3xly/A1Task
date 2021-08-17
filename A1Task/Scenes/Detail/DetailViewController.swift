//
//  DetailViewController.swift
//  A1Task
//
//  Created by Jan Podmolík on 17.08.2021.
//

import UIKit

protocol DetailViewControllerActions: AnyObject {}

final class DetailViewController: UIViewController {

    var viewModel: DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func configureUI() {}
}

extension DetailViewController: DetailViewControllerActions {}
