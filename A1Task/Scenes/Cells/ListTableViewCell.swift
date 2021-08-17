//
//  ListTableViewCell.swift
//  A1Task
//
//  Created by Jan Podmolík on 16.08.2021.
//

import UIKit
import SDWebImage

class ListTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let manaLabel = UILabel()
    let attackLabel = UILabel()
    let healthLabel = UILabel()

    let manaImage = UIImageView()
    let healthImage = UIImageView()
    let attackImage = UIImageView()

    // MARK: Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
        setupImages()
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        [nameLabel, manaLabel, attackLabel, healthLabel].forEach {
            $0.text = nil
        }
    }

    // MARK: Helpers

    func configureUI() {
        [nameLabel, manaLabel, attackLabel, healthLabel,
         manaImage, attackImage, healthImage].forEach {
            contentView.addSubview($0)
            $0.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor,
                      paddingTop: 15, paddingBottom: 15)
        }

        manaImage.anchor(left: contentView.leftAnchor, paddingLeft: 20)
        manaLabel.anchor(left: manaImage.rightAnchor, paddingLeft: 5)

        nameLabel.anchor(left: manaLabel.rightAnchor, paddingLeft: 20)

        healthLabel.anchor(right: contentView.rightAnchor, paddingRight: 20)
        healthImage.anchor(right: healthLabel.leftAnchor, paddingRight: 5)

        attackLabel.anchor(right: healthImage.leftAnchor, paddingRight: 20)
        attackImage.anchor(right: attackLabel.leftAnchor, paddingRight: 5)

        nameLabel.anchor(right: attackImage.leftAnchor, paddingRight: 20)
    }

    func setupLabels() {
        nameLabel.setContentCompressionResistancePriority(.init(749), for: .horizontal)
        nameLabel.setContentHuggingPriority(.init(249), for: .horizontal)
        nameLabel.numberOfLines = 0

        [nameLabel, manaLabel, attackLabel, healthLabel].forEach {
            $0.font = UIFont(name: "Chalkboard SE", size: 16)
        }
    }

    func setupImages() {
        [manaImage, healthImage, attackImage].forEach {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.setDimensions(height: 24, width: 24)
        }

        manaImage.image = UIImage(named: "crystal")
        attackImage.image = UIImage(named: "sword")
        healthImage.image = UIImage(named: "blood_drop")
    }

    func setupCell(with card: Card) {
        nameLabel.text = card.name
        manaLabel.text = String(card.cost ?? 0)
        attackLabel.text = String(card.attack ?? 0)
        healthLabel.text = String(card.health ?? 0)
    }
}
