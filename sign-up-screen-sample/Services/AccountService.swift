//
//  AccountService.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import Foundation



final class AccountService {
    
    
    private init() { }
    
    static let shared = AccountService()
    
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        return true
    }
    
    func validateVerificationCode(_ code: String) -> Bool {
        return true
    }
    
    func tryLogIn(phoneNumber: String, code: String) -> Bool {
        return true
    }
    
    func trySetPasscode(phoneNumber: String, passcode: String) -> Bool {
        return true
    }
}
