//
//  User.swift
//  Application
//
//  Created by Arman Turalin on 9/15/19.
//

import Foundation

struct User: Codable {

    var id: String?
    let name: String
    let image: Data

    init(id: String = UUID().uuidString, name: String, image: Data) {
        self.id = id
        self.name = name
        self.image = image
    }
}
