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
        
        // Verifying whether the URL exists, or else returns a specific error to the console.
        guard let url = URL(string: Constants.endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                // Verifying whether the status code is 200-OK.
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                // Verifying if the data received from the servers matches my APIResponse model.
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                // Decoding the JSON with Codable.
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
        }.resume() // Resumes the data task.
        
    }
    
}
