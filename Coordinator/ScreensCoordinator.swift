//
//  ScreensCoordinator.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

enum AvailableScreens {
    case openLibrary
    case picsum
}
final class ScreensCoordinator: Coordinator {
    // MARK: -
    // MARK: Constants
    public let navigationController: UINavigationController
    // MARK: -
    // MARK: Properties
    private var navigationScreens: [AvailableScreens] = []
    // MARK: -
    // MARK: Init and Deinit
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    public func start() {
        self.jumpToScreen(.picsum)    //
    }
    // MARK: -
    // MARK: Methods

    private func openLibrary() {
        let controller =
            OpenLibraryViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func picSum() {
        let controller =
            PicsumViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }
}
// MARK: -
// MARK: Extensions
extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .openLibrary:
            self.openLibrary()
        case .picsum:
            self.picSum()
        }
    }
}
