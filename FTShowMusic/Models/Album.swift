//
//  Album.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

/// Holds the information for each album, including the Url to fetch the album cover image later on.
struct Album: Codable {
    let id: String
    let imageUrl: String
    let title: String
}
