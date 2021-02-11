//
//  NetworkManager.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

class NetworkManager {
    
    // Initializing the singleton.
    private init() {}
    static let shared = NetworkManager()
    
    /// Makes a network call with URLSession
    func fetchPlaylists(completion: @escaping (Result<APIResponse, FTError>) -> Void) {
        
        // verifying whether the URL exists, or else returns a specific error to the user
        guard let url = URL(string: Constants.endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                
                // verifying whether the status code is 200-OK
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                // decoding the JSON with Codable
                do {
                    let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(apiResponse))
                } catch let error {
                    completion(.failure(.unableToComplete))
                    print("There was an error decoding JSON Data, with description:", error.localizedDescription)
                }
            } else {
                print("There was an error completing the URL ")
                completion(.failure(.unableToComplete))
            }
        }.resume() // starts the data task.
        
    }
    
}
