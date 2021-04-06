//
//  HomePresenter.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//

import Foundation

protocol HomePresenterInterface: PresenterInterface {

}

final class HomePresenter: HomePresenterInterface {

    var router: HomeRouterPresenterInterface!
    var interactor: HomeInteractorPresenterInterface!
    weak var view: HomeViewPresenterInterface!

}

extension HomePresenter: HomePresenterRouterInterface {

}

extension HomePresenter: HomePresenterInteractorInterface {

}

extension HomePresenter: HomePresenterViewInterface {
    func start() {
        view.setupViews()
        view.makeConstraints()
    }

    func didCLickLogoutButton() {
        interactor.logout { (success, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else if success == true {
                print("Logout successfully")
                router.routeToLoginModule()
            }

        }
    }

}
