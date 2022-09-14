//
//  Coordinator.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
