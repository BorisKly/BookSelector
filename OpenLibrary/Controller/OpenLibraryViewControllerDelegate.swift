//
//  OpenLibraryViewControllerDelegate.swift
//  BookSelector
//
//  Created by Boris Klykavka on 29.09.2022.
//

import Foundation

protocol OpenLibraryViewControllerDelegate2: AnyObject {
    func goToDetailBookCoverView()
    }

extension OpenLibraryViewController: OpenLibraryViewControllerDelegate2 {
    func goToDetailBookCoverView() {
        print("!!!@@@")
    }


    func goToCurrencyView() {
        eventHandler?(.detailBookView)
    }
}

