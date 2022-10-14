//
//  OpenLibraryModel.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import Foundation

class OpenLibraryModel {
public var jsonB : [OpenLibraryData]?

    public func setSearchModelForBooks(bookTitle : String, onSuccess: @ escaping () -> Void) {
        NetworkManager.shared.resultOfTitleSearch(dataR: bookTitle, onSuccess:  { [weak self] json in
            self?.jsonB = json
            DispatchQueue.main.async {
                onSuccess()
            }
        }, onError: { print($0)} )
    }

    public func setJpg(cover: Int, onSuccess: @ escaping (Data) -> Void) {
        NetworkManager.shared.fetchImage(imageCoverID: cover, size: Covers.small ) { [weak self] data in
            DispatchQueue.main.async {
                onSuccess(data ?? Data())
            }
        }
    }
}
