//
//  RootPresenter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

final class RootPresenter: PresenterInterface {

    var router: RootRouterPresenterInterface!
    var interactor: RootInteractorPresenterInterface!
    weak var view: RootViewPresenterInterface!

}

extension RootPresenter: RootPresenterRouterInterface {

}

extension RootPresenter: RootPresenterInteractorInterface {

}

extension RootPresenter: RootPresenterViewInterface {

    func start() {

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

    func didClickLoginButton() {
        interactor.login()
    }

    func didClickFacebookLoginButton() {
        interactor.loginWithFacebook()
    }

    func didCLickSignupButton() {
        interactor.signup()
    }

}
