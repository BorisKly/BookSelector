//
//  OpenLibraryModel.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import Foundation

class OpenLibraryModel {

    public var jsonB : [OpenLibraryData]?

    private var imageCash: [Int : Data] = [:]

    public func setSearchModelForBooks(bookTitle : String, onSuccess: @ escaping () -> Void) {
        NetworkManager.shared.openLibraryResultOfTitleSearch(dataR: bookTitle, onSuccess:  { [weak self] json in self?.jsonB = json
            DispatchQueue.main.async{ onSuccess() }
        }, onError: { print($0)} )
}
    public func setJpg(cover: Int, onSuccess: @ escaping (Data) -> Void) {
        if let image = imageCash[cover] {
            onSuccess(image)
            return
        }
        NetworkManager.shared.openLibraryGetTitleImage(dataR: String(cover), onSuccess: { [weak self] data in
            //self?.imageCash[cover] = data
            DispatchQueue.main.async {
                onSuccess(data)
            }
        } )
    }

    public func picsumImage(){
        
    }

}
