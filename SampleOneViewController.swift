//
//  Sample1ViewController.swift
//  BookSelector
//
//  Created by Boris Klykavka on 02.10.2022.
//

import UIKit
enum SampleOne {
    case backTo
    case goTo
}

protocol  SampleOneViewControllerDelegate: AnyObject {
    func selectImage(index: Int)
}

class SampleOneViewController: UIViewController {

   public var eventHandler: ((SampleOne)->())?

    public var model: SampleOneData? = SampleOneData()

    // MARK: - Privat Properties

    private var mainView: SampleOneView? {
        return self.view as? SampleOneView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = SampleOneView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.backgroundPicSum1
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView?.delegate = self
        mainView?.setupUI()
    }

}

extension SampleOneViewController: SampleOneViewControllerDelegate {

    func selectImage(index: Int) {
        guard let str = model?.imageName[index] else {
            return
        }
        print(str)
        mainView?.image.image = UIImage(named: str )
    }

}
