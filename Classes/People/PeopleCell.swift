//
//  PeopleCell.swift
//  Freetime
//
//  Created by Ryan Nystrom on 11/19/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

final class PeopleCell: UICollectionViewCell {

    var avatarImageView = UIImageView()
    var usernameLabel = UILabel()
    var checkmarkLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(checkmarkLabel)

        avatarImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(Styles.Sizes.gutter)
            make.size.equalTo(Styles.Sizes.avatar)
        }

        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(avatarImageView.snp.right).offset(Styles.Sizes.gutter)
        }

        checkmarkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-Styles.Sizes.gutter)
        }

        avatarImageView.configureForAvatar()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public API

    func configure(avatarURL: URL, username: String, showCheckmark: Bool) {
        avatarImageView.sd_setImage(with: avatarURL)
        usernameLabel.text = username
        checkmarkLabel.text = showCheckmark ? Constants.Strings.checkmark : ""
    }
}
