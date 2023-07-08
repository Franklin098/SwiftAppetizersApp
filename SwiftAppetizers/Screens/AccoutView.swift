//
//  AccoutView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct AccoutView: View {
    

    
    @StateObject var viewModel = AccountViewModel()

    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Personal Info"), content: {
                    
                    TextField("First Name", text: $viewModel.user.firstName )
                    
                    TextField("Last Name", text: $viewModel.user.lastName )
                    
                    TextField("Email", text: $viewModel.user.email )
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }

                    
                })
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins )
                        
                    
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills )
                    
                } header: {
                    Text("Requests")
                }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                // environment modiffiers, apply to all toggles inside this section
            


                   
            } .navigationTitle("🧑🏽‍💻 Account")
            
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dimissButton)
        }
    }
}

struct AccoutView_Previews: PreviewProvider {
    static var previews: some View {
        AccoutView()
    }
}
