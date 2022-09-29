//
//  PicsumViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit
enum DetailOpenLibrary {
//    case
//    case
}

class DetailOpenLibraryViewController: UIViewController {

    public var eventHandler: ((DetailOpenLibrary)->())?

    // MARK: - Privat Properties

    private var mainView: DetailOpenLibraryView? {
        return self.view as? DetailOpenLibraryView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = DetailOpenLibraryView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.backgroundPicSum1

        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
