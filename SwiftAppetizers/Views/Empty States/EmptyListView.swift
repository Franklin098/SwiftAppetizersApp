//
//  EmptyListView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 10/07/23.
//

import SwiftUI

struct EmptyListView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .padding()
            }.offset(y:  -50)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(imageName: "empty-list", message: "Test message")
    }
}
