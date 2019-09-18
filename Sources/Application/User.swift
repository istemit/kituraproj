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

    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}
