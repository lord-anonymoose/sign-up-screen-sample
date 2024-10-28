//
//  AccountService.swift
//  sign-up-screen-sample
//
//  Created by Philipp Lazarev on 26.10.2024.
//

import Foundation



final class AccountService {
    
    
    private init() { }
    
    let shared = AccountService()
    
    private func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        return true
    }
    
    private func tryLogIn(phoneNumber: String, code: String) -> Bool {
        return true
    }
    
    private func trySetPasscode(phoneNumber: String, passcode: String) -> Bool {
        return true
    }
}
