//
//  UIButton + ext.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 07.10.2023.
//

import UIKit

extension UIButton {
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.backgroundColor = .pinkColor()
        self.tintColor = .white
        //self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

