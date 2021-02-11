//
//  APIResponse.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

/// A structure that holds all the data contained in the response to a request made to the API Showpad provided for this take-hom assignment
struct APIResponse: Codable {
    let albums: [Album]
    let playlists: [Playlist]
}
