//
//  RootRouter.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

final class RootRouter: RouterInterface {

    weak var presenter: RootPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension RootRouter: RootRouterPresenterInterface {

}