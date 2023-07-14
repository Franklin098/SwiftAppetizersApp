//
//  Order.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 11/07/23.
//


import SwiftUI


final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItems( at offSets: IndexSet){
        items.remove(atOffsets: offSets)
    }
    
    var totalPrice: Double {
        items.reduce(0) { partialResult, appetizer in
            partialResult + appetizer.price
        }
    }
}

