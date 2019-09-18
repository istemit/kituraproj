//
//  CodableRoutes.swift
//  Application
//
//  Created by Arman Turalin on 9/15/19.
//

import Kitura

func initializeCodableRoutes(app: App) {

    app.router.get("/users", handler: app.getUsers)
    app.router.get("/users", handler: app.getUser)
    app.router.post("/users", handler: app.create)
    app.router.put("/users", handler: app.update)
    app.router.delete("/users", handler: app.delete)
}

extension App {
    static var codableUsers = [String : User]()

    func getUsers(completion: @escaping ([User]?, RequestError?) -> Void) {
        execute {
            let allUsers = App.codableUsers.map { $0.value }
            completion(allUsers, nil)
        }
    }

    func getUser(with id: String, completion: @escaping (User?, RequestError?) -> Void) {
        execute {
            guard let user = App.codableUsers[id] else {
                completion(nil, RequestError(rawValue: 404, reason: "Not fount user!"))
                return
            }
            completion(user, nil)
        }
    }

    func create(_ user: User, completion: @escaping (User?, RequestError?) -> Void) {
        let newUser = User(name: user.name)
        guard let userId = newUser.id else {
            completion(nil, .badRequest)
            return
        }
        App.codableUsers[userId] = newUser
        completion(newUser, nil)
    }

    func update(with id: String, updatedUser: User, completion: @escaping (User?, RequestError?) -> Void) {
        App.codableUsers[id] = updatedUser
        completion(updatedUser, nil)
    }

    func delete(with id: String, completion: @escaping (RequestError?) -> Void) {
        App.codableUsers[id] = nil
        completion(nil)
    }
}
