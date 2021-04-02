//
//  RootPresenter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation

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

}
