//
//  ScreensCoordinator.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

enum AvailableScreens {
    case openLibraryScreen
    case detailBookViewScreen
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
        self.jumpToScreen(.openLibraryScreen)
    }
    // MARK: -
    // MARK: Methods

    private func openLibrary() {
        let controller =
            OpenLibraryViewController.startVC()
        controller.eventHandler = { [weak self] event in
            print(event)
            switch event {
            case .detailBookView :
                self?.jumpToScreen(.detailBookViewScreen)}
            }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func detailBookView() {
        let controller =
            DetailOpenLibraryViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }
}
// MARK: -
// MARK: Extensions
extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .openLibraryScreen:
            self.openLibrary()
        case .detailBookViewScreen:
            self .detailBookView()
        }
    }
}
