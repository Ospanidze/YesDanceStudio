//
//  RegistrationViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 06.09.2023.
//

import UIKit

struct Person {
    let number = "+77777777777"
    let password = "123"
}

final class AuthViewController: UIViewController {
    
    private let person = Person()
        
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
        if checkTextFileds() && checkAuth() {
            let vc = RootViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func forgetButtonTapped() {
        let vc = PhoneViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
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
    
    private func checkAuth() -> Bool {
        guard let number = authView?.getText(.number) else {
            return false
        }
        
        if person.number == "+" + number
            && person.password == authView?.getText(.password) {
            print("yes")
            
            return true
        } else {
            authView?.statusLabelIsNotHidden()
        }
        return false
    }
}


