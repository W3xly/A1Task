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

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: Helpers

    private func configureUI() {
        view.backgroundColor = .white

        cardImage.setImage(with: viewModel.card.imgURL)
        
        cardSetLabel.attributedText = viewModel.getLabelString(for: .cardSet)
        classLabel.attributedText = viewModel.getLabelString(for: .playerClass)
        rarityLabel.attributedText = viewModel.getLabelString(for: .rarity)

        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.topAnchor, right: view.rightAnchor,
                            paddingTop: 20, paddingRight: 20)

        view.addSubview(cardImage)
        cardImage.anchor(top: cancelButton.bottomAnchor, paddingTop: 10)
        cardImage.centerX(inView: view)

        view.addSubview(labelsStackView)
        labelsStackView.anchor(top: cardImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                               paddingTop: 40, paddingLeft: 20, paddingRight: 20)

    }

    // MARK: Selectors

    @objc func dismissScene() {
        viewModel.dismissScene()
    }
}

extension DetailViewController: DetailViewControllerActions {}


