//
//  ScreensCoordinator.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

enum AvailableScreens {
    case openLibraryScreen
    case detailBookViewScreen(OpenLibraryData)
    case sampleOne
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
            switch event {
            case .detailBookViewEvent(let book) :
                self?.jumpToScreen(.detailBookViewScreen(book))}
            }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func detailBookView(book: OpenLibraryData) {

        let controller = DetailOpenLibraryViewController.startVCNew(book: book) //
        controller.eventHandler = { event in
            switch event {
            case .backToOpenLibraryEvent:
                self.navigationController.viewControllers.removeLast()
            }
        }
        self.navigationController.pushViewController(controller, animated: true)
    }

    private func sampleOne() {
        let controller =
            SampleOneViewController.startVC()
        controller.eventHandler = { [weak self] event in
            print(event)
            switch event {
            case .goTo:
                self?.jumpToScreen(.openLibraryScreen)
            case .backTo:
                self?.jumpToScreen(.openLibraryScreen)
            }
        }
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
        case .detailBookViewScreen(let book):
            self.detailBookView(book: book)
        case .sampleOne:
            self.sampleOne()
        }
    }
}
