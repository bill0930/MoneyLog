//
//  HomeModuleAssembly.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class HomeModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(HomeRouter.self, initializer: HomeRouter.init)
        container.autoregister(HomePresenter.self, initializer: HomePresenter.init)
        container.autoregister(HomeInteractor.self, initializer: HomeInteractor.init)
        container.autoregister(HomeModule.self, initializer: HomeModule.init)
        container.autoregister(HomeView.self, initializer: HomeView.init as () -> HomeView)
    }
}
