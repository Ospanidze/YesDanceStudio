//
//  UIStackView + ext.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(views: [UIView], spacing: CGFloat, distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis = .vertical) {
        self.init(arrangedSubviews: views)
        self.spacing = spacing
        self.axis = axis
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
