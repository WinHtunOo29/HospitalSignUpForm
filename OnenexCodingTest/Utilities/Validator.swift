//
//  Validator.swift
//  OnenexCodingTest
//
//  Created by Win Htun Oo on 29/06/2023.
//

import Foundation

class Validator {
    static func nrcCheck(id: String) -> (passed: Bool, reason: String) {

        var passed = true
        var reason = "NRC Check Passed."
        if id.isEmpty {
            passed = false
            reason = "ID must not be empty."
        } else if !id.isNumber {
            passed = false
            reason = "Your ID must be number."
        } else if id.count < 6 || id.count > 6 {
            passed = false
            reason = "ID must be 6 digits."
        }

        return (passed, reason)
    }

    static func passwordCheck(password: String) -> (passed: Bool, reason: String) {

        var passed = true
        var reason = "Validation Passed."

        if password.isEmpty {
            reason = "Please fill new password."
            passed = false
        } else if password.count < 4 {
            reason = "Password should be longer than 4 character."
            passed = false
        }

        return (passed, reason)
    }
    
    static func emailCheck(email: String) -> (passed: Bool, reason: String) {

        var passed = true
        var reason = "Profile Validate Passed"
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        if email.isEmpty {
            passed = false
            reason = "Fields cannot be empty."
        } else if !email.isEmpty {
            if !emailTest.evaluate(with: email) {
                passed = false
                reason = "Please enter valid email address."
            }
        }

        return (passed, reason)
    }
}

extension String {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
