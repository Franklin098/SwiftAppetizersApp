//
//  AppetizerListView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()

    
    var body: some View {
        
        ZStack{
            
            NavigationView {
                
                List(self.viewModel.appetizers , rowContent: { appetizer in
                    
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                    
                })
                .navigationTitle("🍉 Appetizers")
                .disabled(viewModel.isShowingDetail)
                
            }.onAppear{
                viewModel.getAppetizers()
            }.blur(radius: viewModel.isShowingDetail ? 20 : 0)
                
            
            if let appetizer = viewModel.selectedAppetizer, viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: appetizer, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            
            
        }.alert(item: $viewModel.alertItem) { alertItem in
            
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dimissButton)
        }
        
    }
    
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
