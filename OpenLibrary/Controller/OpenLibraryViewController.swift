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

   // public var model: BooksModel = BooksModel()

    var itemMenuArray: [BooksModel] = {
        var blankMenu = BooksModel()
        blankMenu.imageName = "Taras"
        blankMenu.name = "Tarsa Shevchenko"
        return [blankMenu]
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
        codeView.backgroundColor = UIColor.blue
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.myBookCellView.delegate = self
        mainView?.myBookCellView.dataSource = self
        mainView?.setupUI()
    }
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

