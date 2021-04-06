//
//  HomeView.swift
//  MoneyLog
//
//  Created by Billy Chan on 7/4/2021.
//

import Foundation
import UIKit

protocol HomeViewInterface: ViewInterface {

}

final class HomeView: UIViewController, HomeViewInterface {

    var presenter: HomePresenterViewInterface!

    lazy private var stateLabel: UILabel = {
        let label = UILabel()
        label.text = UserManager.shared.email
        label.font = UIFont(name: "Helvetica Neue Italic", size: 20.0)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    lazy private var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Log Out", for: .highlighted)
        button.setTitleColor(UIColor.systemBlue.withAlphaComponent(0.5), for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 24.0)
        button.addTarget(self, action: #selector(onClickLogoutButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.presenter.start()
    }

}

extension HomeView {
    private func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.title = "Instagram Home"
    }
}

extension HomeView: HomeViewPresenterInterface {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stateLabel)
        view.addSubview(logoutButton)
    }

    func makeConstraints() {
        stateLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        logoutButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-24)
            $0.left.right.equalToSuperview()
        }
    }

}

// MARK: onClickHandlers
extension HomeView {
    @objc func onClickLogoutButton(_ sender: UIButton) {
        presenter.didCLickLogoutButton()
    }
}
