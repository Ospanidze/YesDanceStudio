//
//  InputTextField.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

final class InputTextField: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let inputTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .systemGray2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let elasticView = ElasticView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        inputTextField.delegate = self
        setupComponents()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String) {
        self.init()
        nameLabel.text = name
    }
    private func setupComponents() {
        addSubviews(nameLabel, elasticView, inputTextField)
        setupLayout()
    }
    
    
    private func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
extension InputTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        elasticView.startAnimation()
    }
    
    
}

//MARK: SetupLayout
extension InputTextField {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            elasticView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            elasticView.leadingAnchor.constraint(equalTo: leadingAnchor),
            elasticView.trailingAnchor.constraint(equalTo: trailingAnchor),
            elasticView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            inputTextField.centerXAnchor.constraint(equalTo: elasticView.centerXAnchor),
            inputTextField.centerYAnchor.constraint(equalTo: elasticView.centerYAnchor),
            inputTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            inputTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
        ])
    }
}
