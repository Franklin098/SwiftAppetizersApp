//
//  APIError.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import Foundation

enum AppetizerError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
