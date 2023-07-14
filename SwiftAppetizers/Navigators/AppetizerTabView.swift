//
//  ContentView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
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
                }.badge(order.items.count)
            
        }
        .accentColor(Color.brandPrimary) // our Color+Ext
    }
}

struct ContentView_Previews: PreviewProvider {
    

    
    static var previews: some View {
        let order = Order()
        
        return AppetizerTabView().environmentObject(order)
    }
}
