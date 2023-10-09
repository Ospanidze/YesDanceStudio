//
//  RegistrationViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

final class AuthViewController: UIViewController {
        
    private var authView: AuthView? {
        view as? AuthView
    }
    
    override func loadView() {
        self.view = AuthView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func authButtonTapped() {
        //authView?.shakeAnimation()
        checkTextFileds()
//        let vc = RootViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func checkTextFileds() -> Bool {
        var result = true

        TextType.allCases.forEach { type in
            if authView?.getText(type) == "" {
                authView?.setIsFailed(type, isFailed: true)
                result = false
            } else {
                authView?.setIsFailed(type, isFailed: false)
            }
        }

        return result
    }
}


