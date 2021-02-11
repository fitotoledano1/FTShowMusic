//
//  ImageLoader.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import SwiftUI

/// This class loads data from a Url (provided in the response from Showpad's API, stored in the model for the Album), and stores it cache for later use. For this take-home assignment, I decided to focus on fluidity of the User Experience. In this case, I'm not displaying an alert every time a network call fails to retrieve an image.
class ImageLoader: ObservableObject {
    
    @Published var imageData = Data()
    
    // Making the callsite initialization as readable as possible.
    init(from urlString: String) {
        let cache = URLCache.shared
        
        // It would be if the URL isn't valid, we just return.
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url,
                                 cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad)
        
        // Verifying if the request has already been previously cached...
        if let data = cache.cachedResponse(for: request)?.data {
            self.imageData = data
            
        // ...or if it hasn't been chached, fetch it.
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if error == nil {
                    guard
                        let response = response,
                        let data = data else {
                        return // Returns out of the function without showing an alert. The reason we are not displaying an alert at this time is that it would interrupt the User Experience too much by too annoying to show too many errors if there was something wrong with the API.
                    }
                    
                    // Storing the data retrieved in cache.
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    
                    // Calling the main thread to display the image changes to the UI.
                    DispatchQueue.main.async {
                        self.imageData = data
                    }
                }
            }).resume()
        }
    }
}


