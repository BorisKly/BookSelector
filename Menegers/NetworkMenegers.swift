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

    private let cache = NSCache<NSString, UIImage>()

    private let cacheLarge = NSCache<NSString, UIImage>()

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

    public func getTitleImage(imageCoverData: String, size: Covers, onSuccess: @escaping (Data) -> () ){
        let API = urlCover + imageCoverData + size.rawValue
        guard  let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) {[weak self] (data, response, error) in
            guard let data = data, error == nil else {return}
            onSuccess(data)
        }
        task.resume()
    }

    public func fetchImage(imageCoverData: String, size: Covers, onSuccess: @escaping (UIImage?) -> Void ){

        if let image = cache.object(forKey: NSString(string: imageCoverData)) {
            print("Using Caching")
            onSuccess(image)
            return
        }

        let API = urlCover + imageCoverData + size.rawValue
        guard  let apiURL = URL(string: API) else {
            onSuccess(nil)
            return
        }
        print("Fetching Image")
        let task = URLSession.shared.dataTask(with: apiURL){ [weak self]
            data, _, error in
            guard let dataN =  data, error == nil else {
                onSuccess(nil)
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: dataN) else {
                    onSuccess(nil)
                    return
                }
                self?.cache.setObject(image, forKey: imageCoverData as NSString)
                onSuccess(image)
            }
        }
        task.resume()
    }

    public func fetchImageLarge(imageCoverData: String, size: Covers, onSuccess: @escaping (UIImage?) -> Void ){

        if let image = cacheLarge.object(forKey: NSString(string: imageCoverData)) {
            print("Using Caching")
            onSuccess(image)
            return
        }

        let API = urlCover + imageCoverData + size.rawValue
        guard  let apiURL = URL(string: API) else {
            onSuccess(nil)
            return
        }
        print("Fetching Image")
        let task = URLSession.shared.dataTask(with: apiURL){ [weak self]
            data, _, error in
            guard let dataN =  data, error == nil else {
                onSuccess(nil)
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: dataN) else {
                    onSuccess(nil)
                    return
                }
                self?.cacheLarge.setObject(image, forKey: imageCoverData as NSString)
                onSuccess(image)
            }
        }
        task.resume()
    }
}
