//
//  String + ext.swift
//  YesDanceStudio
//
//  Created by Айдар Оспанов on 09.10.2023.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
    func formatMobileNumber() -> String {
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        print(cleanPhoneNumber)
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        let endIndex = cleanPhoneNumber.endIndex
        let mask = "+* (***) ***-**-**"
        
        for char in mask where startIndex < endIndex {
            if char == "*" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        return result
    }
}
