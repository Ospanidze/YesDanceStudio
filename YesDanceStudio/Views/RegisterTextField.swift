//
//  RegistrationTextField.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

enum TextType: CaseIterable {
    case number
    case password
}

final class RegisterTextField: UITextField {
    
    var isFailed = false {
        didSet {
            if isFailed {
                self.layer.borderColor = UIColor.red.cgColor
                self.shakeAnimation()
            } else {
                self.layer.borderColor = UIColor.black.cgColor
            }
        }
    }
    
    private var type: TextType = .number
    
    private let padding = UIEdgeInsets(
        top: 0,
        left: 15,
        bottom: 0,
        right: 15
    )
    
    init(placeholder: String, type: TextType) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.type = type
        setupTexField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    private func setupTexField(placeholder: String) {
        delegate = self
        
        if type == .number {
            keyboardType = .phonePad
        }
        
        font = UIFont(name: "Avenir Next", size: 18)
        tintColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
        textColor = #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1)
        backgroundColor = .white
        
        returnKeyType = .done
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [:]
        )
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension RegisterTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isFailed = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
