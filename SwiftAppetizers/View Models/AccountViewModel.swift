//
//  AccountViewModel.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 5/07/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    

    @Published var user = User()
    
    @Published var alertItem: AlertItem?
    
    // UserDefaults is a key-value pair storage, automatically looks for a value and populate the variable
    @AppStorage("user") private var userData: Data?
    
    var isValidForm: Bool {
        
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        alertItem = nil
        return true
    }
    
    func saveChanges () {
        guard isValidForm else {
            return
        }
        
        // actually persist the changes
        do {
            let data = try JSONEncoder().encode(self.user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser () {
        guard let userData = userData else {
            return
        }
        
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
}
