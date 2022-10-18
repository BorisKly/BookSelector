//
//  String+Localization.swift
//  BookSelector
//
//  Created by Boris Klykavka on 18.10.2022.
//

import Foundation

extension String {
    func localize() -> String {
        return NSLocalizedString(self, tableName: "Localization", comment: self)
    }
}
