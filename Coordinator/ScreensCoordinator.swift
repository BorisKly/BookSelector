//
//  ScreensCoordinator.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

enum AvailableScreens {
    case openLibrary
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
        self.jumpToScreen(.openLibrary)    //
    }
    // MARK: -
    // MARK: Methods

    private func openLibrary() {
        let controller =
            OpenLibraryViewController.startVC()
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
        }
    }
}
