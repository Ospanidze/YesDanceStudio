//
//  TitleView.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 07.10.2023.
//

import UIKit

final class TitleView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        //label.text =
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        titleLabel.text = text
        
        setupViews()
        setupLayout()
       
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        print(touches)
//    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 10
        
        addSubview(titleLabel)
    }
}

//MARK: SetupLayout

extension TitleView {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

