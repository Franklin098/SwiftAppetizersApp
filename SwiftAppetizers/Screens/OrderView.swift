//
//  OrderView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    
                    List {
                        // delete modifier is only available on the ForEach component
                        ForEach(order.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }.onDelete { indexSet in
                            self.order.deleteItems(at: indexSet)
                        }
                        
                        
                    }.listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        AppetizerButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyListView(imageName: "empty-list", message: "You have no items in your order.")
                }
                
            }.navigationTitle("🧾 Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        let order = Order()
        order.items = MockData.orderList
        
        return OrderView().environmentObject(order)
    }
}
