//
//  RootRouter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

protocol RootRouterInterface: RouterInterface {
    var presenter: RootPresenterRouterInterface! { get set }

    var viewController: UIViewController? { get set }
}

final class RootRouter: RootRouterInterface {

    weak var presenter: RootPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension RootRouter: RootRouterPresenterInterface {
    func routeToForgetPasswordModule() {
        print("This is RootRouter, i am going to route to forgetPassWordModule")
    }

}
