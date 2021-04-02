//
//  RootView.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit

final class RootView: UIViewController, ViewInterface {

    var presenter: RootPresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.start()
    }

}

extension RootView: RootViewPresenterInterface {

}
