//
//  DetailOpenLibraryModel.swift
//  BookSelector
//
//  Created by Boris Klykavka on 30.09.2022.
//

import Foundation

class DetailOpenLibraryModel {
    // MARK: -
    // MARK: Public Properties

    public var book: OpenLibraryData

    // MARK: -
    // MARK: Private Properties

    private var imageCash: [Int : Data] = [:]

    // MARK: -
    // MARK: Init and Deinit
    init(book: OpenLibraryData) {
        self.book = book
    }

    // MARK: -
    // MARK: Public Methods

    public func setJpgLarge(cover: Int, onSuccess: @ escaping (Data) -> Void) {
        if let data = imageCash[cover] {
            onSuccess(data)
            return
        }

        NetworkManager.shared.getTitleImage(imageCoverData: String(cover), size: .large, onSuccess: { [weak self] data in
            self?.imageCash[cover] = data
            DispatchQueue.main.async {
                onSuccess(data)
            }
        })
    }
}
