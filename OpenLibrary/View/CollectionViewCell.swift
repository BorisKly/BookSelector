//
//  CollectionViewCell.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!

    @IBOutlet weak var bookTitle: UILabel!

    var book: BooksModel? {
        didSet {
            bookTitle.text = book?.name
            if let image = book?.imageName {
                bookImage.image = UIImage(named: image)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
