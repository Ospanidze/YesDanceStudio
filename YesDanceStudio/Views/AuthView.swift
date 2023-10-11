//
//  AuthView.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import UIKit

final class AuthView: UIView {
    
    private var isPravite = true
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .pinkColor()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
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
        text: "Неправильный логин и пароль",
        font: UIFont.italicSystemFont(ofSize: 14),
        foregroundColor: .pinkColor()
    )
    
    private lazy var authButton = UIButton(text: "Войти")
    
    private let numberTextField = RegisterTextField(
        placeholder: "+7 701 7000 00 00",
        type: .number
    )
    private let passwordTextField = RegisterTextField(
        placeholder: "Пароль",
        type: .password
    )
    
    private lazy var eyeButton = EyeButton()
    
    private lazy var forgetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.pinkColor(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupViews()
        setupPasswordTextField()
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
    
    func statusLabelIsGood() {
        statusLabel.isHidden = false
        statusLabel.text = "Good"
        statusLabel.textColor = .systemGreen
        statusLabel.shakeAnimation()
    }
    
    func statusLabelIsNotHidden() {
        statusLabel.isHidden = false
        statusLabel.shakeAnimation()
    }
    
    func activityIndicatorStartAnimating() {
        activityIndicator.startAnimating()
    }
    
    func activityIndicatorStopAnimating() {
        activityIndicator.stopAnimating()
        
    }
    
    private func configure() {
        numberTextField.delegate = self
        passwordTextField.delegate = self
        
        backgroundColor = .white
        statusLabel.isHidden = true
        authButton.addTarget(
            nil,
            action: #selector(AuthViewController.authButtonTapped),
            for: .touchUpInside
        )
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        forgetButton.addTarget(
            nil,
            action:  #selector(AuthViewController.forgetButtonTapped),
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
            authButton,
            forgetButton,
            activityIndicator
        )
        
        setupPasswordTextField()
        setupLayout()
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    private func setupPasswordTextField() {
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
    }
    
    @objc private func eyeButtonTapped() {
        let imageName = isPravite ? "eye" : "eye.slash"
        
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPravite.toggle()
    }
}

extension AuthView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == numberTextField {
            numberTextField.isFailed = false
        } else {
            passwordTextField.isFailed = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard textField == numberTextField else { return true }

        if let text = textField.text, let rangeText = Range(range, in: text) {

            let updateText = text.replacingCharacters(in: rangeText, with: string)

            numberTextField.text = updateText.formatMobileNumber()
            return false
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordTextField {
            guard let text = passwordTextField.text else { return }
            eyeButton.isEnabled = !text.isEmpty
        }
    }
}

extension AuthView {
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
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
        
        NSLayoutConstraint.activate([
            forgetButton.topAnchor.constraint(equalTo: authButton.bottomAnchor, constant: 20),
            forgetButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
