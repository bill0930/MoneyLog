//
//  HomeView.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class HomeModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(HomeRouterInterface.self, initializer: HomeRouter.init)
        container.autoregister(HomePresenterInterface.self, initializer: HomePresenter.init)
        container.autoregister(HomeInteractorInterface.self, initializer: HomeInteractor.init)
        container.autoregister(HomeModuleInterface.self, initializer: HomeModule.init)
        container.autoregister(HomeViewInterface.self, initializer: HomeView.init as () -> HomeView)
    }
}
