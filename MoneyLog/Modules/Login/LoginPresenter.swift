//
//  LoginPresenter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit
import ProgressHUD

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

    func didClickLoginButton(withEmail email: String, password: String, button: UIButton) {
        ProgressHUD.show()
        button.isEnabled = false
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
        interactor.login(withEmail: email, password: password) { (success) in
            button.isEnabled = true
            button.backgroundColor = UIColor.systemBlue
            if success {
                ProgressHUD.showSuccess()
            } else {
                ProgressHUD.showFailed()
            }
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
