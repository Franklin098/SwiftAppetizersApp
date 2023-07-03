//
//  RemoteImage.swift
//  SwiftAppetizers
//
//  Created by Franklin Velásquez on 2/07/23.
//

import SwiftUI


final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    
    func load(fromUrlString urlString: String){
        
        // note we have UIImage (UIKit) and Image (SwiftUI)
        NetworkManager.shared.downloadImage(fromUrlString: urlString) { optUIImage in
            
            guard let uiImage = optUIImage else {
                return
            }
            
            // trigger UI changae on the main thread
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
}



struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
    
}


struct AppetizerRemoteImage: View {

    let urlString: String
    
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View{
        
        RemoteImage(image: imageLoader.image)
            .onAppear{
                
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
