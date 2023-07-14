//
//  SwiftAppetizersApp.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

@main
struct SwiftAppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        
        WindowGroup {
            
            AppetizerTabView()
                .environmentObject(order)
                 
        }
    }
}
