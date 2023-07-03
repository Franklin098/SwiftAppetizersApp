//
//  Alert.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 28/06/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    var id = UUID()
    
    let title: Text
    let message: Text
    let dimissButton: Alert.Button
}


struct AlertContext {
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received form the server was invalid. Pelase contact support."),
                                       dimissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response from the server. Pelase contact support."),
                                       dimissButton: .default(Text("OK")))
    
    static let invalidUrl = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. Pelase contact support."),
                                       dimissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete your request at this time. Check your network connection."),
                                       dimissButton: .default(Text("OK")))
}