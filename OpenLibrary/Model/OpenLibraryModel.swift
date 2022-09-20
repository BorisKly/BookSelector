//
//  OpenLibraryModel.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import Foundation

class OpenLibraryModel {

    var jsonB : OpenLibraryData?

    public func setSearchModelForBooks(bookTitle : String, onSuccess: @ escaping () -> Void) {
        NetworkManager.shared.opelLibrarySimpleArray(dataR: bookTitle, onSuccess:  { [weak self] json in self?.jsonB = json
            DispatchQueue.main.async{ onSuccess() }
        }, onError: { print($0)} )
}
}

