//
//  NetworkMenegers.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import Foundation
import UIKit

class NetworkManager {

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    private let urlSearch = "https://openlibrary.org/search.json"

    private let urlCover = "http://covers.openLibrary.org/b/id/"

    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func resultOfTitleSearch(dataR: String, onSuccess: @escaping ([OpenLibraryData]) -> (), onError: (Error) ->()) {
        guard let url = URL(string: urlSearch + "?title=\(dataR)") else { return }
        let task = URLSession.shared.dataTask(with: url ){ (data, response, error) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(OpenLibraryResponseData.self, from: data) else {print("Error - cannot get information from url"); return}
            onSuccess(
                jsonString.documents.compactMap({ elem in
                    guard elem.title != nil else {
                    return nil
                }
                    let viewData = OpenLibraryData(
                        title: elem.title,
                        cover: elem.coverI )
                return viewData
            }))
        }
        task.resume()
     }

<<<<<<< Updated upstream
    public func getTitleImage(imageCoverData: String, size: Covers, onSuccess: @escaping (Data) -> () ){
        let API = urlCover + imageCoverData + size.rawValue
        guard  let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) {(data, response, error) in
            guard let data = data, error == nil else {return}
            onSuccess(data)
=======
    public func fetchImage(imageCoverID: Int, size: Covers, onSuccess: @escaping (Data?) -> Void ) {
        let key = NSString(string: "\(imageCoverID) \(size.rawValue)")
        if let image = cache.object(forKey: key) {
            onSuccess(image.image)
            return
        }

        let API = urlCover + String(imageCoverID) + size.rawValue
        guard  let apiURL = URL(string: API) else {
            onSuccess(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: apiURL) { [weak self] (data, _, error) in
            guard let dataN =  data, error == nil else {
                onSuccess(nil)
                return
            }
            self?.cache.setObject(ImageData(dataN), forKey: key)
            onSuccess(dataN)
>>>>>>> Stashed changes
        }
        task.resume()
    }

}
