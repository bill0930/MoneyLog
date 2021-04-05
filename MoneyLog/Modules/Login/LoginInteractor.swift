//
//  LoginInteractor.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation

protocol LoginInteractorInterface: InteractorInterface {
}

final class LoginInteractor: LoginInteractorInterface {

    weak var presenter: LoginPresenterInteractorInterface!
}

extension LoginInteractor: LoginInteractorPresenterInterface {
    func login(success: (Bool) -> Void) {
        print("Calling Login Service help you login")
        success(true)
    }

    func loginWithFacebook(success: (Bool) -> Void) {
        print("Calling FaceBook Service help you login")
        success(true)
    }

    func signup() {
        print("This is Inteactor, i am going to handle the singup")
    }
}
