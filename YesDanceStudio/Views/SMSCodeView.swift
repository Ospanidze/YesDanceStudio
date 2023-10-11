//
//  SMSCodeView.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 10.10.2023.
//

import UIKit

final class SMSCodeView: UIView {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.imageName)?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel = UILabel(
        text: "Введите номер телефона",
        font: .systemFont(ofSize: 16, weight: .regular),
        textAlignment: .left
    )
    
    private let statusLabel = UILabel(
        text: "Неверный код",
        font: UIFont.italicSystemFont(ofSize: 14),
        foregroundColor: .pinkColor()
    )
    
    private let codeTextField = RegisterTextField(
        placeholder: "******",
        type: .password
    )
    
    private lazy var codeButton = UIButton(text: "Войти")
    
    private let timeLabel = UILabel(
        text: "Оправить код можно через 2 мин",
        font: .systemFont(ofSize: 16, weight: .regular),
        textAlignment: .center,
        foregroundColor: .systemGray4
    )
    
    private lazy var sendCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оправить код повторно", for: .normal)
        button.setTitleColor(.pinkColor(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupViews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTimeLabel(with seconds: Int) {
        timeLabel.text = "Оправить код можно через \(seconds.secondsToString()) c."
    }
    
    func timeLabelIsNotHidden() {
        timeLabel.isHidden = false
    }
    
    func sendCodeButton(isEnabled: Bool) {
        sendCodeButton.isEnabled = isEnabled
        sendCodeButton.alpha = isEnabled ? 1 : 0.5
    }

    func getText() -> String {
        return codeTextField.text ?? ""
    }
    
    func setIsFailed(isFailed: Bool) {
        codeTextField.isFailed = isFailed
    }
    
    func statusLabelIsNotHidden() {
        statusLabel.isHidden = false
        statusLabel.shakeAnimation()
    }
    
    private func configure() {
        
        backgroundColor = .white
        statusLabel.isHidden = true
        timeLabel.isHidden = true
        codeButton.addTarget(
            nil,
            action: #selector(SMSCodeViewController.smsCodeButtonTapped),
            for: .touchUpInside
        )
        sendCodeButton.addTarget(
            nil,
            action: #selector(SMSCodeViewController.sendCodeButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupViews() {
        addSubviews(
            logoImageView,
            titleLabel,
            statusLabel,
            codeTextField,
            codeButton,
            timeLabel,
            sendCodeButton
        )
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

//MARK: SetupLayout
extension SMSCodeView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 78),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            codeTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            codeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            codeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            codeTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        
        NSLayoutConstraint.activate([
            codeButton.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 30),
            codeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            codeButton.heightAnchor.constraint(equalToConstant: 40),
            codeButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: codeButton.bottomAnchor, constant: 30),
            //timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
        ])
        
        NSLayoutConstraint.activate([
            sendCodeButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            sendCodeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
