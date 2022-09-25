//
//  OpenLibraryViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

protocol  OpenLibraryViewControllerDelegate: AnyObject {
    func ttttt()
}

class OpenLibraryViewController: UIViewController {

    public var model: OpenLibraryModel = OpenLibraryModel()

    var listOfSearchBooks: [BooksModel] = {
        var blankMenu = BooksModel()
        blankMenu.imageName = "Taras"
        blankMenu.name = "Taras Shevchenko"

        var blankMenu2 = BooksModel()
        blankMenu2.imageName = "Ostap"
        blankMenu2.name = "Ostap Vishnya"

        var blankMenu3 = BooksModel()
        blankMenu2.imageName = "Pavlo"
        blankMenu2.name = "Pavlo one"

        var blankMenu4 = BooksModel()
        blankMenu2.imageName = "John"
        blankMenu2.name = "Jonn B"

        return [blankMenu, blankMenu2, blankMenu3, blankMenu4]
    }()

    var searchTitleText = String()

    // MARK: - Privat Properties

    private var mainView: OpenLibraryView? {
        return self.view as? OpenLibraryView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = OpenLibraryView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.background1

        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.delegate = self
        mainView?.myBookItemView.delegate = self
        mainView?.myBookItemView.dataSource = self
        mainView?.bookFinderSearchBar.delegate = self
        mainView?.setupUI()
}

}

extension OpenLibraryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" || searchText != " " else {
            print("empty search")
            return
        }
        searchTitleText = searchText.lowercased()
        print(searchTitleText)
    }
}

extension OpenLibraryViewController: OpenLibraryViewControllerDelegate {
    func ttttt() {
        model.setSearchModelForBooks(bookTitle: searchTitleText) { print("\(self.searchTitleText)") }
    }
}
