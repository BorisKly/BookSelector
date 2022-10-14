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
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 2
        self.setOptionsForOneItemCollection()
        self.setConstraintsForOneItemCollection(pad: padding)
    }

    private func setOptionsForOneItemCollection() {
        bookTitle.backgroundColor = Colors.background3
        bookTitle.numberOfLines = 0
        bookTitle.adjustsFontSizeToFitWidth = true
        bookTitle.backgroundColor = Colors.backgroundPicSum2
        bookImage.backgroundColor = Colors.backgroundPicSum2
    }

    private func setConstraintsForOneItemCollection(pad: CGFloat) {
        bookImage.pin
            .top(pin.safeArea)
            .left(pin.safeArea)
            .margin(pad)

        bookTitle.pin
            .below(of: bookImage, aligned: .left)
            .width(of: bookImage)
            .pinEdges()
            .marginTop(pad)
            .sizeToFit(.width)

    }

}
