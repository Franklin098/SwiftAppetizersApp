//
//  NetworkManager.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    
    private let appetizerrURl = baseURL + "/appetizers"
    
    private init () {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], AppetizerError>) -> Void){
        
        guard let url = URL(string: appetizerrURl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { optData, optResponse, error in
            
            if error != nil {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = optResponse as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = optData else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
}
