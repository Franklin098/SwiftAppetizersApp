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

struct MockData {
    
    
    static let sampleAppetizer = Appetizer(id: 101, name: "Test Appetizer", protein: 20, price: 18, calories: 340, carbs: 220,
                                           imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Mango_-_single.jpg/1200px-Mango_-_single.jpg", description: "This is an appetizer")
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
