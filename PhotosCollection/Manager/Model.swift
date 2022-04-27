//
//  Model.swift
//  PhotosCollection
//
//  Created by Nodirbek on 27/04/22.
//

import Foundation

// MARK: - WelcomeElement
struct PhotoResults: Codable {
    let results: [Results]
}

struct Results: Codable {
    let urls: Urls
}

struct Urls: Codable {
    let regular: String
}
