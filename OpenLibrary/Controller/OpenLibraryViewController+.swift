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
        itemOne?.bookTitle.text = item?.title
        itemOne?.bookImage.image = UIImage(named: "noImage")
        model.setJpg(cover: item?.cover ?? 0) { [weak self, item] data in
            if itemOne?.bookTitle.text == item?.title {
                itemOne?.bookImage.image = UIImage(data: data)
            }
            if item?.cover == nil  {itemOne?.bookImage.image = UIImage(named: "noImage")
            }
        }
        return itemOne ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = model.jsonB?[indexPath.row] else {
            return
        }
        eventHandler?(.detailBookViewEvent(item))
       
    }
}
