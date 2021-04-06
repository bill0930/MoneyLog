//
//  LoginService.swift
//  MoneyLog
//
//  Created by Billy Chan on 6/4/2021.
//

import Foundation
import Firebase
import FirebaseAuth

protocol LoginServiceInterface: class {
    func createUser(withEmail email: String, password: String)
    func signIn(withEmail email: String, password: String, completion: @escaping (User?, Error?) -> Void )
}

final class FirebaseLoginService: LoginServiceInterface {
    func createUser(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          print("createUser with \(email) and password\(password)")
            print(authResult, error)
        }
    }

    func signIn(withEmail email: String, password: String, completion:  @escaping (User?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
          guard let strongSelf = self else { return }
            guard error == nil else {
                print(error?.localizedDescription)
                completion(nil, error)
                return
            }
            if let result = result {
                let user = FirebaseUser(email: result.user.email ?? "", displayName: result.user.displayName ?? "")
                completion(user, nil)
            }
        }
    }

}
