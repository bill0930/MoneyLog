//
//  LoginModule.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//
import Foundation
import UIKit
import Swinject
// MARK: - router

protocol LoginRouterPresenterInterface: RouterPresenterInterface {
    func routeToForgetPasswordModule()
    func routeToHomeModule()
}

// MARK: - presenter

protocol LoginPresenterRouterInterface: PresenterRouterInterface {

}

protocol LoginPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol LoginPresenterViewInterface: PresenterViewInterface {
    func start()
    func didClickEyeButton(passwordTextField: UITextField, eyeButton: UIButton)
    func didClickForgetButton()
    func didClickLoginButton(withEmail email: String, password: String)
    func didClickFacebookLoginButton()
    func didCLickSignupButton()
    func didFindUserLoggedIn()
}

// MARK: - interactor

protocol LoginInteractorPresenterInterface: InteractorPresenterInterface {
    func login(withEmail email: String, password: String, completion: (Bool) -> Void)
    func loginWithFacebook(success: (Bool) -> Void)
    func signup()
}

// MARK: - view

protocol LoginViewPresenterInterface: ViewPresenterInterface {
    func setupViews()
    func makeConstraints()
}

// MARK: - module builder

protocol LoginModuleInterface: ModuleInterface {

}

final class LoginModule: LoginModuleInterface {

    typealias View = LoginViewInterface
    typealias Presenter = LoginPresenterInterface
    typealias Router = LoginRouterInterface
    typealias Interactor = LoginInteractorInterface

    func build() -> UIViewController? {
        let resolver = MainAssembler.shared.assembler.resolver

        let view = resolver.resolve(View.self) as? LoginView
        let presenter = resolver.resolve(Presenter.self) as? LoginPresenter
        let router = resolver.resolve(Router.self) as? LoginRouter
        let interactor = resolver.resolve(Interactor.self) as? LoginInteractor

        if let view = view, let presenter = presenter, let router = router, let interactor = interactor {
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
            router.viewController = view
            interactor.presenter = presenter
            view.presenter = presenter
        } else {
            return UIViewController()
        }

        return view
    }

}
