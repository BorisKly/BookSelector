//
//  NetworkMenegers.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import Foundation

//enum CurrencyToShow: String {
// }

class NetworkManager {

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func opelLibrarySimpleArray(dataR: String, onSuccess: @escaping (OpenLibraryData) -> (), onError: (Error) ->()) {
        guard let url = URL(string: "https://openlibrary.org/search.json?q=\(dataR)") else { return }
        let task = URLSession.shared.dataTask(with: url ){ (data, response, error) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(OpenLibraryResponseData.self, from: data) else {print("Error - cannot get information from url"); return}
            //print(jsonString)
            let curr = jsonString.documents.first?.seed

            let curr2 = curr?.compactMap({ if $0.contains("/books") { } } )
            print(curr2)
            let viewData = OpenLibraryData(seed: curr ?? ["!!!"])
            //print(viewData.seed)
            onSuccess(viewData)
        }
        task.resume()
     }
}
