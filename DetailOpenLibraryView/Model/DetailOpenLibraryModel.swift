//
//  DetailOpenLibraryModel.swift
//  BookSelector
//
//  Created by Boris Klykavka on 30.09.2022.
//

import Foundation

class DetailOpenLibraryModel {
    public var book: OpenLibraryData

    private var imageCash: [Int : Data] = [:]

    init(book: OpenLibraryData) {
        self.book = book
    }

    public func setJpgLarge(cover: Int, onSuccess: @ escaping (Data) -> Void) {
        if let image = imageCash[cover] {
            onSuccess(image)
            return
        }
        NetworkManager.shared.detailOpenLibraryGetTitleImageLarge(dataR: String(cover), onSuccess: { [weak self] data in
            self?.imageCash[cover] = data
            DispatchQueue.main.async {
                onSuccess(data)
            }
        } )
    }
}
