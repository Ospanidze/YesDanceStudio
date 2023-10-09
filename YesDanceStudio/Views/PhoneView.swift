//
//  PhoneView.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import UIKit

final class PhoneView: UIView {
    
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
        text: "Неправильный логин и пароль",
        font: UIFont.italicSystemFont(ofSize: 14),
        foregroundColor: .pinkColor()
    )
    
    private let numberTextField = RegisterTextField(
        placeholder: "+7 701 7000 00 00",
        type: .number
    )
    
    private lazy var phoneButton = UIButton(text: "Оправить код")
    
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
    
    
    func getText() -> String {
        return numberTextField.text ?? ""
    }
    
    func setIsFailed(isFailed: Bool) {
        numberTextField.isFailed = isFailed
    }
    
    func statusLabelIsNotHidden() {
        statusLabel.isHidden = false
    }
    
    private func configure() {
        numberTextField.delegate = self
        
        backgroundColor = .white
        statusLabel.isHidden = true
        phoneButton.addTarget(
            nil,
            action: #selector(PhoneViewController.phoneButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupViews() {
        addSubviews(
            logoImageView,
            titleLabel,
            statusLabel,
            numberTextField,
            phoneButton
        )
    }
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

extension PhoneView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        numberTextField.isFailed = false
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
}


extension PhoneView {
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
            numberTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            numberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            numberTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        
        NSLayoutConstraint.activate([
            phoneButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 30),
            phoneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            phoneButton.heightAnchor.constraint(equalToConstant: 40),
            phoneButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
        ])
    }
}
