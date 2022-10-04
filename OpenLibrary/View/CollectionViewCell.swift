//
//  CollectionViewCell.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit
import PinLayout

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!

    @IBOutlet weak var bookTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setConstraintsForOneItemCollection()
        self.setOptionsForOneItemCollection()
    }

    private func setOptionsForOneItemCollection() {
        bookTitle.backgroundColor = Colors.background3
        bookTitle.numberOfLines = 0
        bookTitle.adjustsFontSizeToFitWidth = true
        bookTitle.backgroundColor = Colors.backgroundPicSum2
        bookImage.backgroundColor = Colors.backgroundPicSum2
    }

    private func setConstraintsForOneItemCollection() {
        bookImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2).isActive = true
        bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2).isActive = true
        bookImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 200).isActive = true

        bookTitle.trailingAnchor.constraint(equalTo: bookImage.trailingAnchor).isActive = true
        bookTitle.leadingAnchor.constraint(equalTo: bookImage.leadingAnchor).isActive = true
        bookTitle.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: -1).isActive = true
        bookTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
