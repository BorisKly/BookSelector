//
//  OpenLibraryViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

protocol  OpenLibraryViewControllerDelegate: AnyObject {
    func reloadCollectionAfterSearchChange()
}

enum OpenLibraryJumpTo {
    case detailBookViewEvent(OpenLibraryData)
}

class OpenLibraryViewController: UIViewController {

    public var eventHandler: ((OpenLibraryJumpTo)->())?

    public var model: OpenLibraryModel = OpenLibraryModel()

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
        codeView.backgroundColor = Colors.backgroundPicSum1

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

// MARK: - Extensions

extension OpenLibraryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" || searchText != " " else {
            return
        }
        searchTitleText = searchText.lowercased()
    }
}

extension OpenLibraryViewController: OpenLibraryViewControllerDelegate {

    func reloadCollectionAfterSearchChange() {
        model.setSearchModelForBooks(bookTitle: searchTitleText) { [weak self] in
            self?.mainView?.myBookItemView.reloadData()
        }
    }
}
