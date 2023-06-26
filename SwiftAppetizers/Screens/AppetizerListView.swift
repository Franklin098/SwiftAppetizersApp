//
//  AppetizerListView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 25/06/23.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        
        NavigationView {
            
            List(MockData.appetizers, rowContent: { appetizer in
                
                AppetizerCell(appetizer: appetizer)
            })
            .navigationTitle("🍉 Appetizers")
            
        }
        
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
