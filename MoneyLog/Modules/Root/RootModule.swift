//
//  RootModule.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//
import Foundation
import UIKit

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

}

// MARK: - module builder

final class RootModule: ModuleInterface {

    typealias View = RootView
    typealias Presenter = RootPresenter
    typealias Router = RootRouter
    typealias Interactor = RootInteractor

    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        let viewController = self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        return viewController
    }

    private func assemble(view: RootView, presenter: RootPresenter, router: RootRouter, interactor: RootInteractor) -> UIViewController {
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        interactor.presenter = presenter
        view.presenter = presenter

        return view
    }

}
