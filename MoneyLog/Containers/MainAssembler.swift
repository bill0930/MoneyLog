//
//  ModuleAssembler.swift
//  MoneyLog
//
//  Created by Billy Chan on 4/4/2021.
//

import Foundation
import Swinject

struct MainAssembler {
    static let shared = MainAssembler()

    let assembler = Assembler([
        LoginModuleAssembly(),
        ServiceAssembly()
    ])
}
