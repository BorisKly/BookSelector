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

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func openLibraryResultOfTitleSearch(dataR: String, onSuccess: @escaping ([OpenLibraryData]) -> (), onError: (Error) ->()) {
        guard let url = URL(string: "https://openlibrary.org/search.json?title=\(dataR)") else { return }
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
                    print(viewData)
                return viewData
            }))
        }
        task.resume()
     }

    public func openLibraryGetTitleImage(dataR: String, onSuccess: @escaping (Data) -> () ){
        let API = "http://covers.openLibrary.org/b/id/" + dataR + "-S.jpg"
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

    public func picsumImage(onSuccess: @escaping (Data) -> (), onError: @escaping (Error) -> Void ){

        let API = "http://picsum.photos/200/300"

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
