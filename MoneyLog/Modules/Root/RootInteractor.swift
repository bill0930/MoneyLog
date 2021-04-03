//
//  RootInteractor.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation

protocol RootInteractorInterface: InteractorInterface {
    var presenter: RootPresenterInteractorInterface! { get set }
}

final class RootInteractor: RootInteractorInterface {

    weak var presenter: RootPresenterInteractorInterface!
}

extension RootInteractor: RootInteractorPresenterInterface {
    func login() {
        print("This is Inteactor, i am going to handle the login")
    }

    func loginWithFacebook() {
        print("This is Inteactor, i am going to handle the facebook login")
    }

    func signup() {
        print("This is Inteactor, i am going to handle the singup")
    }
}
