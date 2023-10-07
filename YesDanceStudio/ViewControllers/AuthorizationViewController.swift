//
//  ViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    private let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "joker")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor.secondarySystemBackground, for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var authorizationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Авторизация", for: .normal)
        button.setTitleColor(UIColor.secondarySystemBackground, for: .normal)
        button.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var switchOn: UISwitch = {
        let switchOn = UISwitch()
        switchOn.isOn = false
        switchOn.translatesAutoresizingMaskIntoConstraints = false
        return switchOn
    }()
    
    private let loginTextField = InputTextField(name: "Login")
    private let passwordTextField = InputTextField(name: "Password")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func setupComponents() {
        addSubviews(
            backImageView,
            loginTextField,
            passwordTextField,
            registrationButton,
            authorizationButton,
            switchOn
        )
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
     @objc private func authButtonTapped() {
         if switchOn.isOn {
             let coachVC = CoachViewController()
             navigationController?.pushViewController(coachVC, animated: true)
         } else {
             let coachVC = UserViewController()
             navigationController?.pushViewController(coachVC, animated: true)
         }
    }
    
    @objc private func registerButtonTapped() {
        let registerVC = RegistrationViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

extension AuthorizationViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -20
            ),
            passwordTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            passwordTextField.heightAnchor.constraint(equalToConstant: 70),
        ])
        
        NSLayoutConstraint.activate([
            loginTextField.bottomAnchor.constraint(
                equalTo: passwordTextField.topAnchor,
                constant: -12
            ),
            loginTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            loginTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            loginTextField.heightAnchor.constraint(
                equalTo: passwordTextField.heightAnchor
            ),
        ])
        
        NSLayoutConstraint.activate([
            registrationButton.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor,
                constant: 30
            ),
            registrationButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            )
        ])
        
        NSLayoutConstraint.activate([
            authorizationButton.topAnchor.constraint(
                equalTo: registrationButton.bottomAnchor,
                constant: 10
            ),
            authorizationButton.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            )
        ])
        
        NSLayoutConstraint.activate([
            switchOn.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -20),
            switchOn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         ])
    }
}
