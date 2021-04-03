//
//  Assembler.swift
//  MoneyLog
//
//  Created by Billy Chan on 4/4/2021.
//

import Foundation
import Swinject

extension Assembler {
    static let shared = Assembler([
        RootModuleAssembly()
    ])
}
