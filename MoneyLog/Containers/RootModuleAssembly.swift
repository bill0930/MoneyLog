//
//  RootModuleAssembly.swift
//  MoneyLog
//
//  Created by Billy Chan on 3/4/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class RootModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(RootRouterInterface.self, initializer: RootRouter.init)
        container.autoregister(RootPresenterInterface.self, initializer: RootPresenter.init)
        container.autoregister(RootInteractorInterface.self, initializer: RootInteractor.init)
        container.autoregister(RootModuleInterface.self, initializer: RootModule.init)
        container.autoregister(RootViewInterface.self, initializer: RootView.init as () -> RootView)
    }
}
