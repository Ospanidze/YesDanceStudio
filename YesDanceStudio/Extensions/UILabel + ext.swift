//
//  UILabel + ext.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 07.10.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, textAlignment: NSTextAlignment = .left, foregroundColor: UIColor = .black, numberOfLines: Int = 1) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = foregroundColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.minimumScaleFactor = 0.8
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
