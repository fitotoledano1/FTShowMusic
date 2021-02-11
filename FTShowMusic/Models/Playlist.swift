//
//  Playlist.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

/// Holds the playlist data obtained from the Showpad API. The key 'albums' contains the **ids** of the albums, and not the album objects. We filter for these albums in the view model for the Playlist View.
struct Playlist: Codable {
    let title: String
    let id: String
    let albums: [String]
}
