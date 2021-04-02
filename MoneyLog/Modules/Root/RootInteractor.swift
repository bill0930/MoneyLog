//
//  RootInteractor.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation

final class RootInteractor: InteractorInterface {

    weak var presenter: RootPresenterInteractorInterface!
}

extension RootInteractor: RootInteractorPresenterInterface {

}
