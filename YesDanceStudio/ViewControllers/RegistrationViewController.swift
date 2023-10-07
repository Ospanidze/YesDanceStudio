//
//  RegistrationViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    private lazy var mainStackView = UIStackView()
    
    private let firstName = RegistrationTextField(textPlaceholder: "Имя")
    private let lastName = RegistrationTextField(textPlaceholder: "Фамилия")
    private let email = RegistrationTextField(textPlaceholder: "Почта")
    private let password = RegistrationTextField(textPlaceholder: "Пароль")
    private let passwordRepeat = RegistrationTextField(textPlaceholder: "Повторите пароль")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupComponents()
    }
    
    private func setupComponents() {
        
        let textFields = [
            firstName,
            lastName,
            email,
            password,
            passwordRepeat
        ]
        
        addSubviews(views: textFields)
        setupLayout()
    }
    
    private func addSubviews(views: [UIView]) {
        mainStackView = UIStackView(
            views: views,
            spacing: 10,
            distribution: .fillEqually
        )
        view.addSubview(mainStackView)
    }
    
//    private func checkValid() {
//        guard let
//    }
}

extension RegistrationViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            mainStackView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.4
            )
        ])
    }
}
