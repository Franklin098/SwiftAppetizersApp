//
//  AppetizerDetailView.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 3/07/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack (spacing:40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button{
                print("tapped")
            } label: {
               
                AppetizerButton(title: "\(appetizer.price, specifier: "%.2f") - Add To Order")
                
            }.padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( alignment: .topTrailing, content: {
            Button{
                self.isShowingDetail = false
            } label: {
                DismissCircleButton()
            }
        })
    }
    
    
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing:5){
            Text("Calories")
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}
