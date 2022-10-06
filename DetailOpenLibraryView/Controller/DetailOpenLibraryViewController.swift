//
//  PicsumViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit
enum DetailOpenLibraryJumpTo {
    case backToOpenLibraryEvent
}

class DetailOpenLibraryViewController: UIViewController {

    // MARK: -
    // MARK: Public Properties

    public var eventHandler: ((DetailOpenLibraryJumpTo)->())?

    public var model: DetailOpenLibraryModel?
    
    // MARK: -
    // MARK: Private Properties

    private var mainView: DetailOpenLibraryView? {
        return self.view as? DetailOpenLibraryView
    }

    // MARK: -
    // MARK: Init and Deinit

    public static func startVC() -> Self {
        return Self.init()
    }

    public static func startVCNew(book: OpenLibraryData) -> Self {
        let controller = Self.init()
        controller.model = DetailOpenLibraryModel(book: book)
        return controller
    }
    
    // MARK: -
    // MARK: Override Methods

    override func loadView() {
        let codeView = DetailOpenLibraryView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.backgroundPicSum1
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureDone))
        mainView?.addGestureRecognizer(tapGesture)
        mainView?.backgroundColor = Colors.backgroundPicSum3
        mainView?.setupUI()
        setImageLarge()
        print("This is ViewDidLoad")
    }

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        print("This is viewDidAppear")
    }

    override func viewDidLayoutSubviews() {
        print("This is viewDidLayoutSubviews")
    }

    // MARK: -
    // MARK: Private Methods

    private func setImageLarge() {
        mainView?.detailViewTitle.text = model?.book.title
        model?.setJpgLarge(cover: model?.book.cover ?? 0) { [weak self] data in
            self?.mainView?.detailImageView.image = UIImage(data: data)
            if data.isEmpty {
                self?.mainView?.detailImageView.image = UIImage(named: "noImage")
            }
        }
}
    @objc private func tapGestureDone() {
        eventHandler?(.backToOpenLibraryEvent)
    }

}
