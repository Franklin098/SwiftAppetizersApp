//
//  LoadingView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 28/06/23.
//

import SwiftUI


struct ActivityIndicator: UIViewRepresentable {
    
    // replaces the usual body
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary // our extension
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    
//    typealias UIViewType = UIActivityIndicatorView()
    
}

struct LoadingView: View {

    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all) // fill the entire screen
            
            ActivityIndicator()
        }
    }
}
