//
//  ContentView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccoutView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            
        }
        .accentColor(Color("brandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
