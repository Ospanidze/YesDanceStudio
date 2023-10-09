//
//  EyeButton.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import UIKit

final class EyeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEyeButton() {
        isEnabled = false
        setImage(UIImage(systemName: "eye.slash"), for: .normal)
        tintColor = .pinkColor()
        widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
