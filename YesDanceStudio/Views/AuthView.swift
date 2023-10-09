//
//  AuthView.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import UIKit

final class AuthView: UIView {
    
    
    
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.imageName)?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel = UILabel(
        text: "Вход",
        font: .systemFont(ofSize: 22, weight: .bold),
        textAlignment: .center
    )
    
    private let statusLabel = UILabel(
        text: "Вход",
        font: UIFont.italicSystemFont(ofSize: 14)
    )
    
    private lazy var authButton = UIButton(text: "Войти")
    
    private let numberTextField = RegisterTextField(
        placeholder: "+77017000951",
        type: .number
    )
    private let passwordTextField = RegisterTextField(
        placeholder: "Пароль",
        type: .password
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getText(_ type: TextType) -> String {
        switch type {
            case .number:
                return numberTextField.text ?? ""
            case .password:
                return passwordTextField.text ?? ""
        }
    }
    
    func setIsFailed(_ type: TextType, isFailed: Bool) {
        switch type {
            case .number:
                numberTextField.isFailed = isFailed
            case .password:
                passwordTextField.isFailed = isFailed
        }
    }
    
    func statusLabelIsNotHidden() {
        statusLabel.isHidden = false
    }
    
    private func configure() {
        backgroundColor = .white
        statusLabel.isHidden = true
        authButton.addTarget(
            nil,
            action: #selector(AuthViewController.authButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupViews() {
        addSubviews(
            logoImageView,
            titleLabel,
            statusLabel,
            numberTextField,
            passwordTextField,
            authButton
        )
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}



extension AuthView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 78),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 33),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            numberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numberTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalTo: numberTextField.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            authButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            authButton.heightAnchor.constraint(equalToConstant: 40),
            authButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
        ])
    }
}
