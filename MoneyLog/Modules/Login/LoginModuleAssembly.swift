//
//  LoginModuleAssembly.swift
//  MoneyLog
//
//  Created by Billy Chan on 3/4/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class LoginModuleAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginRouterInterface.self, initializer: LoginRouter.init)
        container.autoregister(LoginPresenterInterface.self, initializer: LoginPresenter.init)
        container.autoregister(LoginInteractorInterface.self, initializer: LoginInteractor.init)
        container.autoregister(LoginModuleInterface.self, initializer: LoginModule.init)
        container.autoregister(LoginViewInterface.self, initializer: LoginView.init as () -> LoginView)
    }
}
