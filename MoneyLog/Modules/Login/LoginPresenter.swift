//
//  LoginPresenter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

protocol LoginPresenterInterface: PresenterInterface {
}

final class LoginPresenter: LoginPresenterInterface {

    var router: LoginRouterPresenterInterface!
    var interactor: LoginInteractorPresenterInterface!
    weak var view: LoginViewPresenterInterface!

}

extension LoginPresenter: LoginPresenterRouterInterface {

}

extension LoginPresenter: LoginPresenterInteractorInterface {

}

extension LoginPresenter: LoginPresenterViewInterface {

    func start() {
        view.setupViews()
        view.makeConstraints()
    }

    func didClickForgetButton() {
        router.routeToForgetPasswordModule()
    }

    func didClickEyeButton(passwordTextField: UITextField, eyeButton: UIButton) {
        passwordTextField.isSecureTextEntry =  !passwordTextField.isSecureTextEntry
        if passwordTextField.isSecureTextEntry {
            eyeButton.setTitle(String.fontAwesomeIcon(name: .eyeSlash), for: .normal)
            eyeButton.setTitleColor(UIColor(red: 150, green: 150, blue: 150), for: .normal)
        } else {
            eyeButton.setTitle(String.fontAwesomeIcon(name: .eye), for: .normal)
            eyeButton.setTitleColor(UIColor(red: 150, green: 150, blue: 150), for: .normal)
        }
    }

    func didClickLoginButton(withEmail email: String, password: String) {
        interactor.login(withEmail: email, password: password) { (isLogin) in
            print(isLogin)
        }
    }

    func didClickFacebookLoginButton() {
        interactor.loginWithFacebook { (success) in
            print("loginWithFacebook", success)
        }
    }

    func didCLickSignupButton() {
        interactor.signup()
    }

    func didFindUserLoggedIn() {
        router.routeToHomeModule()
    }

}
