//
//  RootView.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit
import SnapKit
import FontAwesome_swift

final class RootView: UIViewController, ViewInterface {

    var presenter: RootPresenterViewInterface!

    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = UIFont(name: "Helvetica Neue Italic", size: 32.0)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    lazy private var usernameTextField: UITextField = {
        let textField = UITextField()
        let leftVIew: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftView = leftVIew
        textField.leftViewMode = .always
        textField.placeholder = "Username"
        textField.font = UIFont(name: "Helvetica Neue", size: 12.0)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.returnKeyType = .default
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        return textField
    }()

    lazy private var passwordTextField: UITextField = {
        let textField = UITextField()
        let leftVIew: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))

        textField.leftView = leftVIew
        textField.rightView = eyeButton
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.placeholder = "Password"
        textField.font = UIFont(name: "Helvetica Neue", size: 12.0)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.returnKeyType = .default
        textField.clearButtonMode = .never
        textField.contentVerticalAlignment = .center
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        return textField
    }()

    lazy private var eyeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.fontAwesome(ofSize: 12, style: .regular)
        button.setTitle(String.fontAwesomeIcon(name: .eyeSlash), for: .normal)
        button.setTitleColor(UIColor(red: 150, green: 150, blue: 150), for: .normal)
        button.addTarget(self, action: #selector(didEyeButtonClicked), for: .touchUpInside)
        return button
    }()

    @objc func didEyeButtonClicked(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry =  !passwordTextField.isSecureTextEntry
        if passwordTextField.isSecureTextEntry {
            eyeButton.setTitle(String.fontAwesomeIcon(name: .eyeSlash), for: .normal)
            eyeButton.setTitleColor(UIColor(red: 150, green: 150, blue: 150), for: .normal)
        } else {
            eyeButton.setTitle(String.fontAwesomeIcon(name: .eye), for: .normal)
            eyeButton.setTitleColor(UIColor(red: 150, green: 150, blue: 150), for: .normal)
        }
    }

    lazy private var forgetButton: UIButton = {
        let button = UIButton()
        return button
    }()

    lazy private var loginButton: UIButton = {
        let button = UIButton()
        return button
    }()

    lazy private var dividerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy private var facebookLoginButton: UIButton = {
        let button = UIButton()
        return button
    }()

    lazy private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        makeConstraints()
        self.presenter.start()
    }

}

extension RootView: RootViewPresenterInterface {

}

extension RootView {
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(bottomView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
    }

    private func makeConstraints() {

        bottomView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(100)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(80)
            $0.height.equalTo(80)
            $0.left.right.equalToSuperview()
        }

        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.height.equalTo(40)
            $0.left.equalTo(12)
            $0.right.equalTo(-12)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(8)
            $0.height.equalTo(40)
            $0.left.equalTo(12)
            $0.right.equalTo(-12)
        }

    }
}

extension RootView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(String.fontAwesomeIcon(name: .eyeSlash))
    }
}
