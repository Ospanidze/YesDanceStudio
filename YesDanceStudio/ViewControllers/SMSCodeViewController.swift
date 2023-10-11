//
//  SMSCodeViewController.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 10.10.2023.
//

import UIKit

final class SMSCodeViewController: UIViewController {
    
    private lazy var timeCounter = TimeCounter(time: 120) { status, seconds in
        self.setupTimeLabel(seconds)
    
        self.update(with: status)
        //print(status)
    }
    
    private var smsCodeView: SMSCodeView? {
        view as? SMSCodeView
    }
    
    override func loadView() {
        self.view = SMSCodeView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func smsCodeButtonTapped() {
        if checkTextFiled()  {
            checkAuth()
        }
    }
    
    @objc func sendCodeButtonTapped() {
        presentAlert(title: "Оправлен код", message: nil)
        
        if timeCounter.status == .end {
            timeCounter.refreshTimer()
        }
        timeCounter.status = .start
        smsCodeView?.timeLabelIsNotHidden()
        
        
    }
    
    private func update(with status: Status) {
        switch status {
            case .start:
                smsCodeView?.sendCodeButton(isEnabled: false)
            case .end:
                smsCodeView?.sendCodeButton(isEnabled: true)
                timeCounter.status = .end
        }
    }
    
    
    
    private func setupTimeLabel(_ seconds: Int) {
       smsCodeView?.setupTimeLabel(with: seconds)
    }
    
    private func checkTextFiled() -> Bool {

        if smsCodeView?.getText() == "" {
            smsCodeView?.setIsFailed(isFailed: true)
            return false
        } else {
            smsCodeView?.setIsFailed(isFailed: false)
            return true
        }
    }
    
    private func checkAuth()  {
        guard let text = smsCodeView?.getText(), !text.isEmpty else {
            return
        }
        let code = text
        
        AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    let vc = RootViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                self?.smsCodeView?.statusLabelIsNotHidden()
            }
        }
    }
}

