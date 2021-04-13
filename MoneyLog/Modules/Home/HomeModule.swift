//
//  HomeModule.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//
import Foundation
import UIKit

// MARK: - router

protocol HomeRouterPresenterInterface: RouterPresenterInterface {
    func routeToLoginModule()
}

// MARK: - presenter

protocol HomePresenterRouterInterface: PresenterRouterInterface {

}

protocol HomePresenterInteractorInterface: PresenterInteractorInterface {

}

protocol HomePresenterViewInterface: PresenterViewInterface {
    func start()
    func didCLickLogoutButton()
}

// MARK: - interactor

protocol HomeInteractorPresenterInterface: InteractorPresenterInterface {
    func logout(completion: (Bool, Error?) -> Void)
}

// MARK: - view

protocol HomeViewPresenterInterface: ViewPresenterInterface {
    func setupViews()
    func makeConstraints()
}

protocol HomeModuleInterface: ModuleInterface {

}

// MARK: - module builder

final class HomeModule: HomeModuleInterface {

    typealias View = HomeViewInterface
    typealias Presenter = HomePresenterInterface
    typealias Router = HomeRouterInterface
    typealias Interactor = HomeInteractorInterface

    func build() -> UIViewController? {
        let resolver = MainAssembler.shared.assembler.resolver

        let view = resolver.resolve(View.self) as? HomeView
        let presenter = resolver.resolve(Presenter.self) as? HomePresenter
        let router = resolver.resolve(Router.self) as? HomeRouter
        let interactor = resolver.resolve(Interactor.self) as? HomeInteractor

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
