//
//  ModuleAssembler.swift
//  MoneyLog
//
//  Created by Billy Chan on 4/4/2021.
//

import Foundation
import Swinject

struct ModuleAssembler {
    static let shared = ModuleAssembler()

    let assembler = Assembler([
        LoginModuleAssembly()
    ])
}
