//
//  SignInViewModel.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation
import SwiftUI

class SignInViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showSignInAlert: Bool = false
        
    func logInBtnTapped(completion: (HomeRoute?) -> Void) {
//        if isValidCredentials(email: email, password: password) {
            completion(.tabs)
//        } else {
//            showSignInAlert = true
//            completion(nil)
//        }
    }
    
    private func isValidCredentials(email: String, password: String) -> Bool {
        var isValid = false
        
        guard !email.isEmpty else { return isValid }
        guard !password.isEmpty else { return isValid }
        
        let isValidPassword = password.count >= 6
        let emailRegex = "[A-Za-z0-9.%+-]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        isValid = isValidPassword && isEmailValid
        
        return isValid
    }
    
    func resetTextFields() {
        email = ""
        password = ""
    }
}

