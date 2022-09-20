//
//  OpenLibraryResponceData.swift
//  BookSelector
//
//  Created by Boris Klykavka on 14.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct OpenLibraryResponseData: Codable {
    let documents: [WelcomeDoc]

    enum CodingKeys: String, CodingKey {
        case documents = "docs"
    }
}

// MARK: - WelcomeDoc
struct WelcomeDoc: Codable {
    let seed: [String]

    enum CodingKeys: String, CodingKey {
        case seed
    }
}
