//
//  RegistrationTextField.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

final class RegistrationTextField: UITextField {
    
    private let padding = UIEdgeInsets(
        top: 0,
        left: 15,
        bottom: 0,
        right: 15
    )
    
    init(textPlaceholder: String) {
        super.init(frame: .zero)
        placeholder = textPlaceholder
        configure()
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
    
//    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        !isFirstResponder
//    }
    
    private func configure() {
        let avenirNextfont = UIFont(name: "Avenir Next", size: 18)
        font = avenirNextfont
        tintColor = .systemGray2
        textAlignment = .left
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
