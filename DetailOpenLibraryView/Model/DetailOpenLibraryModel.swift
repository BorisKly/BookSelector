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
    // MARK: Init and Deinit
    init(book: OpenLibraryData) {
        self.book = book
    }

    // MARK: -
    // MARK: Public Methods

    public func setJpgLarge(itemcover: Int, onSuccess: @ escaping (Data) -> Void) {
        NetworkManager.shared.fetchImage(imageCoverID: itemcover, size: Covers.large ) { [weak self] data in
            DispatchQueue.main.async {
                onSuccess(data ?? Data())
            }
        }
    }
}
