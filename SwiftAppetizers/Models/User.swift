//
//  User.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 7/07/23.
//

import Foundation

// Codable -> both Decodable and Encodable
struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
    
}
