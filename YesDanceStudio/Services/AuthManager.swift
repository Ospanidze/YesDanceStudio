//
//  AuthManager.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import FirebaseAuth

final class AuthManager {
    
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    private var veficationID: String?
    
    private init() {}
    
    func startAuth(phoneNumber: String, completion: @escaping(Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] veficationID, error in
            guard let veficationID, error == nil else {
                return
            }
            self?.veficationID = veficationID
            completion(true)
        }
    }
    
    func verifyCode(smsCode: String, completion: @escaping(Bool) -> Void) {
        guard let veficationID else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: veficationID,
            verificationCode: smsCode
        )
        
        auth.signIn(with: credential) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
