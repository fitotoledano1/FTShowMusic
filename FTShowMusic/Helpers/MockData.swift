//
//  MockData.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

/// Some data I played around with while building this project for my take-home assignment with Showpad
struct MockData {
    
    /// Album Example: Parachutes, by Coldplay
    static let parachutes = Album(id: "1",
                                  imageUrl: "https://upload.wikimedia.org/wikipedia/en/5/57/Coldplayparachutesalbumcover.jpg",
                                  title: "Parachutes")
    
    /// Playlist Exmaple: My favorite Coldplay Albums
    static let coldplayPlaylist = Playlist(title: "Coldplay favs",
                                           id: "1",
                                           albums: ["0"])
}
