//
//  LoginInteractor.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation

protocol LoginInteractorInterface: InteractorInterface {
    var loginService: LoginServiceInterface { get set }
}

final class LoginInteractor: LoginInteractorInterface {

    weak var presenter: LoginPresenterInteractorInterface!
    var loginService: LoginServiceInterface

    init(loginService: LoginServiceInterface) {
        self.loginService = loginService
    }
}

extension LoginInteractor: LoginInteractorPresenterInterface {
    func login(withEmail email: String, password: String, completion: (Bool) -> Void) {
        loginService.signIn(withEmail: email, password: password) { (user, error) in
            if let user = user {
                print(user)
            } else {
                print(error?.localizedDescription)
            }
        }
    }

    func loginWithFacebook(success: (Bool) -> Void) {
        print("Calling FaceBook Service help you login")
        success(true)
    }

    func signup() {
        print("This is Inteactor, i am going to handle the singup")
    }
}
