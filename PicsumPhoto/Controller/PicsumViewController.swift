//
//  PicsumViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 27.09.2022.
//

import UIKit

protocol  PicsumViewControllerDelegate: AnyObject {
    func ddd()
}

class PicsumViewController: UIViewController {

    public var model: OpenLibraryModel = OpenLibraryModel()

    // MARK: - Privat Properties

    private var mainView: PicsumView? {
        return self.view as? PicsumView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = PicsumView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.backgroundPicSum1

        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.delegate = self
        mainView?.setupUI()

        // Do any additional setup after loading the view.
    }

    public func picsumImage(){

        let API = "http://picsum.photos/200/300"

        guard  let apiURL = URL(string: API) else {
            fatalError("some error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiURL) {(data, response, error) in
            guard let data = data, error == nil else {return}
        DispatchQueue.main.async {
            self.mainView?.picsumImageView.image = UIImage(data: data)
        }
        }
        task.resume()
    }

}

extension PicsumViewController: PicsumViewControllerDelegate {
    func ddd() {
        picsumImage()
//        model.setSearchModelForBooks(bookTitle: searchTitleText) { [weak self] in
//             print("\(self?.searchTitleText)") }
    }
}
