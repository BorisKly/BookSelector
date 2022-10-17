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

    public var eventHandler: ((DetailOpenLibraryJumpTo) -> Void)?

    public var model: DetailOpenLibraryModel?
    
    // MARK: -
    // MARK: Private Properties

    private var mainView: DetailOpenLibraryView? {
        return self.view as? DetailOpenLibraryView
    }

    // MARK: -
    // MARK: Init and Deinit

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
        setImageLarge()
    }

    // MARK: -
    // MARK: Private Methods

    private func setImageLarge() {
        mainView?.detailViewTitle.text = model?.book.title
        mainView?.detailImageView.image = UIImage(named: "noImage")
        if  let item = model?.book.cover {
            model?.setJpgLarge(itemcover: item) { [weak self] data in
                DispatchQueue.main.async {
                    self?.mainView?.detailImageView.image = UIImage(data: data)
                }
            }
        }
    }
    @objc private func tapGestureDone() {
        eventHandler?(.backToOpenLibraryEvent)
    }

}
