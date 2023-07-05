//
//  DismissCircleButton.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 3/07/23.
//

import SwiftUI

struct DismissCircleButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .frame(width: 44, height: 44)
                .imageScale(.small)
                .foregroundColor(.black)
        }
    }
}

struct DismissCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissCircleButton()
    }
}
