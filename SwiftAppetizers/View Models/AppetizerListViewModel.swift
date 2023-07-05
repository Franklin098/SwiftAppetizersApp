//
//  AppetizerListViewModel.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 26/06/23.
//

import SwiftUI


final class AppetizerListViewModel : ObservableObject {
    
    @Published public var appetizers: [Appetizer] = []
    
    @Published public var alertItem: AlertItem?
    
    @Published public var isLoading: Bool = false
    
    @Published public var isShowingDetail = false
    
    @Published public var selectedAppetizer: Appetizer?
    
    
    func getAppetizers(){
        
        self.isLoading = true
        
        NetworkManager.shared.getAppetizers {result in
            
            // run UI updates in the main thread
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidUrl
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
                
            }
        }
    }
    
}
