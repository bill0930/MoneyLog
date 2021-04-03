//
//  RootPresenter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

protocol RootPresenterInterface: PresenterInterface {
    var router: RootRouterPresenterInterface! { get set }
    var interactor: RootInteractorPresenterInterface! { get set }
    var view: RootViewPresenterInterface! { get set }
}

final class RootPresenter: RootPresenterInterface {

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
        view.setupView()
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
