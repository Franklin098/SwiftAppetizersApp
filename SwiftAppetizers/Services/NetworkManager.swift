//
//  NetworkManager.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import UIKit


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    
    private let appetizerrURl = baseURL + "/appetizers"
    
    // to cache images, avoid downloading the same image multiple times
    private let cache = NSCache<NSString,UIImage>()
    
    
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
    
    
    // we can return nil as the result, then we use the placeholder. Cache de Image
    func downloadImage (fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void ){
        
       
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed( image)
            return
        }
        
        // image is not in the cache, try to download the image

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        

        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { optData, optResponse , error in
            
            
            guard let data = optData, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            print("image  \(image)")
            
            
            completed(image)
        
        }
        
        task.resume()
    }
}
