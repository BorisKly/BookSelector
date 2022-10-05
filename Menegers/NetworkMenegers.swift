//
//  NetworkMenegers.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import Foundation
import UIKit

//enum CurrencyToShow: String {
// }

class NetworkManager {
    
    private enum Covers {
      static let large = "-L.jpg"
      static let small = "-S.jpg"
    }

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    private let urlSearch = "https://openlibrary.org/search.json"

    private let urlCover = "http://covers.openLibrary.org/b/id/"

    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func openLibraryResultOfTitleSearch(dataR: String, onSuccess: @escaping ([OpenLibraryData]) -> (), onError: (Error) ->()) {
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

    public func openLibraryGetTitleImage(dataR: String, onSuccess: @escaping (Data) -> () ){
        let API = urlCover + dataR + Covers.small
        guard  let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) {(data, response, error) in
            guard let data = data, error == nil else {return}
        onSuccess(data)
        }
        task.resume()
    }

    public func detailOpenLibraryGetTitleImageLarge(dataR: String, onSuccess: @escaping (Data) -> () ){
        let API = urlCover + dataR + Covers.large
        guard  let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) {(data, response, error) in
            guard let data = data, error == nil else {return}
        onSuccess(data)
        }
        task.resume()
    }

}
