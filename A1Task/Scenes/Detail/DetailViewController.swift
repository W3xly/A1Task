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

    let cardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setHeight(height: 350)
        return imageView
    }()

    let cardSetLabel = UILabel()
    let classLabel = UILabel()
    let rarityLabel = UILabel()

    lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cardSetLabel, classLabel, rarityLabel])
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()

    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setDimensions(height: 30, width: 30)
        button.addTarget(self, action: #selector(dismissScene), for: .touchUpInside)
        return button
    }()

    var landscapeConstraints: [NSLayoutConstraint] = []
    var portraitConstraints: [NSLayoutConstraint] = []

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if view.deviceOrientation == .portrait {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        } else {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        }
    }
    
    // MARK: Helpers

    private func configureUI() {
        view.backgroundColor = .white

        cardImage.setImage(with: viewModel.card.imgURL)
        cardSetLabel.attributedText = viewModel.getLabelString(for: .cardSet)
        classLabel.attributedText = viewModel.getLabelString(for: .playerClass)
        rarityLabel.attributedText = viewModel.getLabelString(for: .rarity)

        [cancelButton, cardImage, labelsStackView].forEach {
            view.addSubview($0)
        }

        setupOrientationConstraints()

        if view.deviceOrientation == .portrait {
            NSLayoutConstraint.activate(portraitConstraints)
        } else {
            NSLayoutConstraint.activate(landscapeConstraints)
        }
    }

    func setupOrientationConstraints() {
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = view.safeAreaLayoutGuide

        portraitConstraints = [
            cancelButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            cancelButton.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20),
            cardImage.topAnchor.constraint(equalTo: cancelButton.bottomAnchor),
            cardImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            labelsStackView.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 40),
            labelsStackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20)
        ]

        landscapeConstraints = [
            cancelButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            cancelButton.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -30),
            cardImage.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cardImage.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            labelsStackView.leftAnchor.constraint(equalTo: cardImage.rightAnchor, constant: 20),
            labelsStackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ]
    }

    // MARK: Selectors

    @objc func dismissScene() {
        viewModel.dismissScene()
    }
}

extension DetailViewController: DetailViewControllerActions {}


