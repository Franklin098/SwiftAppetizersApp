//
//  AccoutView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct AccoutView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }

    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Personal Info"), content: {
                    
                    TextField("First Name", text: $viewModel.user.firstName )
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName}
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName )
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email}
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email )
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil}
                        .submitLabel(.continue)
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
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss"){
                            focusedTextField = nil
                        }
                    }
                }
            
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
