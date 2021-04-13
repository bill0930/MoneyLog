//
//  HomeRouter.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//

import Foundation
import UIKit

protocol HomeRouterInterface: RouterInterface {

}

final class HomeRouter: HomeRouterInterface {

    weak var presenter: HomePresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension HomeRouter: HomeRouterPresenterInterface {
    func routeToLoginModule() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }

}
