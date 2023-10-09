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
        guard let text = phoneView?.getText(), !text.isEmpty else {
            return
        }
        let number = "+" + text
           
        guard number == Person().number else {
            phoneView?.statusLabelIsNotHidden()
            return
        }
        AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
            guard success else { return }
            DispatchQueue.main.async {
                let vc = RootViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

