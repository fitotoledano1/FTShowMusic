//
//  ImageWithUrl.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import SwiftUI

struct ImageWithURL: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    // Again, making initialization at the call site as readable as possible.
    init(_ url: String) {
        imageLoader = ImageLoader(from: url)
    }
    
    var body: some View {
        // Initializing an empty image if it wasn't possible to retrieve data utilizing the Showpad API
        // Doing this reduce friction in the User Experience - as displaying an alert to the user every time the network call fails to retrieve the image
        Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
            .renderingMode(.original)
            .resizable()
            .frame(width: 150, height: 150)
            .cornerRadius(10)
    }
}
