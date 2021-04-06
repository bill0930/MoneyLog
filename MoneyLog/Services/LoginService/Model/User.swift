//
//  User.swift
//  MoneyLog
//
//  Created by Billy Chan on 6/4/2021.
//

import Foundation
import Firebase
import FirebaseAuth

protocol User {
    var isLogin: Bool { get }
    var email: String { get set }
    var displayName: String { get set}
}

struct FirebaseUser: User {
    var isLogin: Bool = {
        return Auth.auth().currentUser == nil
    }()
    var email: String
    var displayName: String
}
