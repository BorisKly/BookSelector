//
//  OpenLibraryViewController+.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

private var  indentifire: String { "BookModelCell" }

extension OpenLibraryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   model.jsonB?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemOne = collectionView.dequeueReusableCell(withReuseIdentifier: indentifire, for: indexPath) as? CollectionViewCell
        let item = model.jsonB?[indexPath.row]
        itemOne?.bookTitle.backgroundColor = Colors.background3
        //itemOne?.bookTitle.sizeToFit()
        itemOne?.bookTitle.numberOfLines = 0
        itemOne?.bookTitle.adjustsFontSizeToFitWidth = true
        itemOne?.bookTitle.text = item?.title
        //itemOne?.book?.name = item?.title
        itemOne?.bookImage.image = UIImage(named: "Taras")
        //itemOne?.book?.imageName = "Taras"

        itemOne?.backgroundColor = Colors.background2
        return itemOne ?? UICollectionViewCell()
    }

}
