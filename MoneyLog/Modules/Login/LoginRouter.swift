//
//  LoginRouter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

protocol LoginRouterInterface: RouterInterface {
}

final class LoginRouter: LoginRouterInterface {

    weak var presenter: LoginPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension LoginRouter: LoginRouterPresenterInterface {
    func routeToForgetPasswordModule() {
        print("This is LoginRouter, i am going to route to forgetPassWordModule", viewController)
    }

    func routeToHomeModule() {
        print("This is LoginRouter, i am going to route to homeModule", viewController)
//        viewController?.navigationController?.pushViewController(UIViewController(), animated: false)
    }

}
