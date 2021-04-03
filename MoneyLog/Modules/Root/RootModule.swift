//
//  RootModule.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//
import Foundation
import UIKit
import Swinject
// MARK: - router

protocol RootRouterPresenterInterface: RouterPresenterInterface {
    func routeToForgetPasswordModule()
}

// MARK: - presenter

protocol RootPresenterRouterInterface: PresenterRouterInterface {

}

protocol RootPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol RootPresenterViewInterface: PresenterViewInterface {
    func start()
    func didClickEyeButton(passwordTextField: UITextField, eyeButton: UIButton)
    func didClickForgetButton()
    func didClickLoginButton()
    func didClickFacebookLoginButton()
    func didCLickSignupButton()
}

// MARK: - interactor

protocol RootInteractorPresenterInterface: InteractorPresenterInterface {
    func login()
    func loginWithFacebook()
    func signup()
}

// MARK: - view

protocol RootViewPresenterInterface: ViewPresenterInterface {
    func setupView()
    func makeConstraints()
}

// MARK: - module builder

protocol RootModuleInterface: ModuleInterface {

}

final class RootModule: RootModuleInterface {

    typealias View = RootViewInterface
    typealias Presenter = RootPresenterInterface
    typealias Router = RootRouterInterface
    typealias Interactor = RootInteractorInterface

    func build() -> UIViewController? {
        let assembler = Assembler.shared

        let view = assembler.resolver.resolve(View.self) as? RootView
        let presenter = assembler.resolver.resolve(Presenter.self) as? RootPresenter
        let router = assembler.resolver.resolve(Router.self) as? RootRouter
        let interactor = assembler.resolver.resolve(Interactor.self) as? RootInteractor
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
