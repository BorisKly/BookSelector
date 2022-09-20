//
//  OpenLibraryViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

//protocol  OpenLibraryViewControllerDelegate: AnyObject {
//    func dCH()
//}

class OpenLibraryViewController: UIViewController {

    //var json: OpenLibraryData?

    public var model: OpenLibraryModel = OpenLibraryModel()

    var itemMenuArray: [BooksModel] = {
        var blankMenu = BooksModel()
        blankMenu.imageName = "Taras"
        blankMenu.name = "Taras Shevchenko"

        var blankMenu2 = BooksModel()
        blankMenu2.imageName = "Ostap"
        blankMenu2.name = "Ostap Vishnya"

        var blankMenu3 = BooksModel()
        blankMenu2.imageName = "Ostap1"
        blankMenu2.name = "Ostap1 Vishnya"

        var blankMenu4 = BooksModel()
        blankMenu2.imageName = "Ostap2"
        blankMenu2.name = "Ostap2 Vishnya"

        return [blankMenu, blankMenu2, blankMenu3, blankMenu4]
    }()

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
        mainView?.myBookItemView.delegate = self
        mainView?.myBookItemView.dataSource = self
        mainView?.setupUI()
        model.setSearchModelForBooks(bookTitle: "boris") { print("!!!") }

}
// MARK: - Extensions
//
//extension OpenLibraryViewController: OpenLibraryViewControllerDelegate {
//    func dCH() {
//        print("!")
//    }
//
//
//}

}
