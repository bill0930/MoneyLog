//
//  LoginView.swift
//  MoneyLog
//
//  Created by Billy Chan on 2/4/2021.
//

import Foundation
import UIKit
import SnapKit
import FontAwesome_swift
import FirebaseAuth
import RxSwift
import RxCocoa

protocol LoginViewInterface: ViewInterface {
}

final class LoginView: UIViewController, LoginViewInterface {

    var presenter: LoginPresenterViewInterface!

    private var handler: AuthStateDidChangeListenerHandle?
    private var disposeBag = DisposeBag()

    lazy private var container: UIView = {
       let view = UIView()
        return view
    }()

    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = UIFont(name: "Helvetica Neue Italic", size: 48.0)
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
        button.addTarget(self, action: #selector(onClickEyeButton), for: .touchUpInside)
        return button
    }()

    lazy private var forgetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Forgetten password?", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Forgetten password?", for: .highlighted)
        button.setTitleColor(UIColor.systemBlue.withAlphaComponent(0.5), for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12.0)
        button.addTarget(self, action: #selector(onClickForgetButton), for: .touchUpInside)

        return button
    }()

    lazy private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .highlighted)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4.0
        button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 12.0)
        button.rx.tap.asDriver().debounce(.milliseconds(200)).drive { (_) in
            self.onClickLoginButton(button)
        }
        .disposed(by: disposeBag)

        return button
    }()

    lazy private var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.textColor = .lightGray
        label.font = UIFont(name: "Helvetica Neue Bold", size: 12.0)
        return label
    }()

    lazy private var line1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    lazy private var line2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    lazy private var facebookLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.fontAwesomeIcon(name: .facebookSquare, style: .brands, textColor: .systemBlue, size: CGSize(width: 20, height: 20)), for: .normal)
        button.setTitle("Log in with Facebook", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(UIColor.systemBlue.withAlphaComponent(0.5), for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12.0)
        button.addTarget(self, action: #selector(onClickFacebookLoginButton), for: .touchUpInside)
        return button
    }()

    lazy private var bottomView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    lazy private var signupStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    lazy private var signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = .lightGray
        label.font = UIFont(name: "Helvetica Neue", size: 12.0)
        return label
    }()

    lazy private var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue Bold", size: 12.0)
        button.addTarget(self, action: #selector(onClickSignUpButton), for: .touchUpInside)
        return button
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handler = Auth.auth().addStateDidChangeListener { [weak self] (auth, _) in
            if auth.currentUser != nil {
                self?.presenter.didFindUserLoggedIn()
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handler!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.start()
    }

}

extension LoginView: LoginViewPresenterInterface {
    func setupViews() {
        view.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(usernameTextField)
        container.addSubview(passwordTextField)
        container.addSubview(forgetButton)
        container.addSubview(loginButton)
        container.addSubview(orLabel)
        container.addSubview(line1)
        container.addSubview(line2)
        container.addSubview(facebookLoginButton)
        view.addSubview(bottomView)
        bottomView.addSubview(signupStackView)
        signupStackView.addArrangedSubview(signupLabel)
        signupStackView.addArrangedSubview(signupButton)

        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)

        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
    }

    func makeConstraints() {
        bottomView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(80)
        }

        container.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(500)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(100)
            $0.left.right.equalToSuperview()
        }

        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.height.equalTo(40)
            $0.left.equalTo(12)
            $0.right.equalTo(-12)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(12)
            $0.height.equalTo(40)
            $0.left.equalTo(12)
            $0.right.equalTo(-12)
        }

        forgetButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.right.equalTo(-12)
            $0.height.equalTo(20)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgetButton.snp.bottom).offset(24)
            $0.left.equalTo(12)
            $0.right.equalTo(-12)
            $0.height.equalTo(40)
        }

        orLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }

        line1.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.left.equalToSuperview().offset(12)
            $0.height.equalTo(1)
            $0.right.equalTo(orLabel.snp.left).offset(-12)
        }

        line2.snp.makeConstraints {
            $0.centerY.equalTo(orLabel)
            $0.right.equalToSuperview().offset(-12)
            $0.height.equalTo(1)
            $0.left.equalTo(orLabel.snp.right).offset(12)
        }

        facebookLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
            $0.bottom.equalToSuperview().offset(-24)
        }

        signupStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        signupLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }

        signupButton.snp.makeConstraints {
            $0.height.equalTo(20)
        }

    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let username = usernameTextField.text, !username.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.systemBlue
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
// MARK: onClickHandlers
extension LoginView {
    @objc func onClickEyeButton(_ sender: UIButton) {
        presenter.didClickEyeButton(passwordTextField: passwordTextField, eyeButton: eyeButton)
    }

    @objc func onClickForgetButton(_ sender: UIButton) {
        presenter.didClickForgetButton()
    }

    @objc func onClickLoginButton(_ sender: UIButton) {
        presenter.didClickLoginButton(withEmail: usernameTextField.text!, password: passwordTextField.text!, button: sender)
    }

    @objc func onClickFacebookLoginButton(_ sender: UIButton) {
        presenter.didClickFacebookLoginButton()
    }

    @objc func onClickSignUpButton(_ sender: UIButton) {
        presenter.didCLickSignupButton()
    }
}
