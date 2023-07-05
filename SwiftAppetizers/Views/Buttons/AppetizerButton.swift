//
//  AppetizerButton.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 3/07/23.
//

import SwiftUI

struct AppetizerButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(self.title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

struct AppetizerButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButton(title: "test")
    }
}
