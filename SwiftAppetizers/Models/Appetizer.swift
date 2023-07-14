//
//  File.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import Foundation


struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let protein: Int
    let price: Double
    let calories, carbs: Int
    let imageURL: String
    let description: String
}

let mockImageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Mango_-_single.jpg/1200px-Mango_-_single.jpg"

struct MockData {
    
    
    static let sampleAppetizer = Appetizer(id: 101, name: "Test Appetizer", protein: 20, price: 18, calories: 340, carbs: 220,
                                           imageURL:mockImageURL , description: "This is an appetizer")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItem2 = Appetizer(id: 102, name: "Order Item 2", protein: 20, price: 18, calories: 340, carbs: 220,
                                           imageURL: mockImageURL, description: "This is an appetizer")
    
    static let orderItem3 = Appetizer(id: 102, name: "Order Item 3", protein: 20, price: 18, calories: 340, carbs: 220,
                                           imageURL: mockImageURL, description: "This is an appetizer")
    
    static let orderItem4 = Appetizer(id: 102, name: "Order Item 4", protein: 20, price: 18, calories: 340, carbs: 220,
                                           imageURL: mockImageURL, description: "This is an appetizer")
    
    
    static let orderList = [orderItem2, orderItem3, orderItem4]

}
