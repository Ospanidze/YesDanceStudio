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
//        if checkTextFileds() && checkAuth() {
//            authView?.activityIndicatorStartAnimating()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.authView?.activityIndicatorStopAnimating()
//                let vc = RootViewController()
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        }
        
        if checkTextFileds() && checkAuth() {
            authView?.activityIndicatorStartAnimating()
            authView?.statusLabelIsGood()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.authView?.activityIndicatorStopAnimating()
                let vc = RootViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc func forgetButtonTapped() {
        let vc = PhoneViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
//        guard let number = authView?.getText(.number) else {
//            return
//        }
//        guard let passwordText = authView?.getText(.password) else { return }
//
//        AuthManager.shared.signIn(with: number, and: passwordText) { [weak self] success in
//            if success {
//                self?.authView?.statusLabelIsGood()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self?.authView?.activityIndicatorStopAnimating()
//                    let vc = RootViewController()
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                }
//            } else {
//                self?.authView?.statusLabelIsNotHidden()
//            }
//        }
        
        guard let number = phoneNumberText() else { return false }
        guard let password = authView?.getText(.password) else { return false }
        
        if person.number == "+" + number && person.password == password {
            return true
        } else {
            authView?.statusLabelIsNotHidden()
        }
        
        return false
    }
    
    private func phoneNumberText() -> String? {
        guard let text = authView?.getText(.number) else { return nil }
        
        let number = text
        var result = ""
        var anotherNumber = result
       
        number.forEach { char in
            let string = String(char)
            
            if let _ = Int(string) {
                result += string
            }
        }
        
        if anotherNumber.count > 11 {
            anotherNumber.removeLast()
        }
        
        if result.count == 11 {
            return result
        } else if anotherNumber.count == 11 {
            return anotherNumber
        }
        
        return nil
    }
}


