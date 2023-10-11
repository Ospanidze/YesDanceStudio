//
//  PhoneViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import UIKit

final class PhoneViewController: UIViewController {
    
    private var phoneView: PhoneView? {
        view as? PhoneView
    }
    
    override func loadView() {
        self.view = PhoneView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func phoneButtonTapped() {
        if checkTextFiled()  {
            checkAuth()
        }
    }
    
    private func checkTextFiled() -> Bool {

        if phoneView?.getText() == "" {
            phoneView?.setIsFailed(isFailed: true)
            return false
        } else {
            phoneView?.setIsFailed(isFailed: false)
            return true
        }
    }
    
    private func checkAuth()  {
        
        guard let result = phoneNumberText() else {
            phoneView?.statusLabelIsNotHidden()
            return
        }
        
        AuthManager.shared.startAuth(phoneNumber: "+" + result) { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    let vc = SMSCodeViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    private func phoneNumberText() -> String? {
        guard let text = phoneView?.getText() else { return nil }
        
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

