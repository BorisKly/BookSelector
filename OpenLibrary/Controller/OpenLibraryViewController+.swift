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
        return  30  //itemMenuArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifire, for: indexPath) as? CollectionViewCell
       // itemCell?.bookTitle.text = "!!!"
        itemCell?.books = listOfSearchBooks[(indexPath.row > 3) ? 3 : indexPath.row ]
        itemCell?.backgroundColor = UIColor.red
        return itemCell ?? UICollectionViewCell()
    }

}


