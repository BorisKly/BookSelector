//
//  PicsumViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit
enum DetailOpenLibrary {
    case backToOpenLibrary
//    case
}

class DetailOpenLibraryViewController: UIViewController {

   public var eventHandler: ((DetailOpenLibrary)->())?

    public var model: DetailOpenLibraryModel?
    
    // MARK: - Privat Properties

    private var mainView: DetailOpenLibraryView? {
        return self.view as? DetailOpenLibraryView
    }

    private let data = [Int: String]()





    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    public static func startVCNew(book: OpenLibraryData) -> Self {
        let contrll = Self.init()
        contrll.model = DetailOpenLibraryModel(book: book)
        return contrll
    }

    

    // MARK: - Override Methods

    override func loadView() {
        let codeView = DetailOpenLibraryView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.backgroundPicSum1

        self.view = codeView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.backgroundColor = UIColor.red
        mainView?.detailViewTitle.text = model?.book.title

        mainView?.setupUI()

    }

}
