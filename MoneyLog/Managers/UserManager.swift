//
//  UserManager.swift
//  MoneyLog
//
//  Created by Billy Chan on 6/4/2021.
//

import Foundation
import FirebaseAuth

struct UserManager {
    static var shared = UserManager()
    var isLogin: Bool = false
    var email: String = ""
    var displayName: String = ""

    private init() {}

    func loadUser(user: User) {
        UserManager.shared.displayName = user.displayName
        UserManager.shared.email = user.email
        UserManager.shared.isLogin = user.isLogin
    }

    func clearUser() {
        UserManager.shared = UserManager()
    }
}
