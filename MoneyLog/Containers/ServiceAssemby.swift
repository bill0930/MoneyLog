//
//  ServiceAssembler.swift
//  MoneyLog
//
//  Created by Billy Chan on 6/4/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginServiceInterface.self, initializer: FirebaseLoginService.init)
    }
}
