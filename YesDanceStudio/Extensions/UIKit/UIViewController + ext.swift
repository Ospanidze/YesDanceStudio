//
//  UIViewController + ext.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 07.10.2023.
//

import UIKit

extension UIViewController {
    
    var width: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    func createTitleView(_ title: String) -> UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width * 0.44, height: 30)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        titleLabel.minimumScaleFactor = 0.7
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.frame = CGRect(x: 0, y: 0, width: width * 0.32, height: 20)
        titleLabel.center = view.center
        
        view.addSubview(titleLabel)
        
        return view
    }
    
    func presentAlert(title: String, message: String?) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
