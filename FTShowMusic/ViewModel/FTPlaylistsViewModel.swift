//
//  FTPlaylistsViewModel.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import Foundation

class FTPlaylistsViewModel: ObservableObject {
    
    @Published var playlists: [Playlist] = []
    
    @Published var albums: [Album] = []
    @Published var filterredAlbums: [Album] = []
    
    /// Making the network call to the Showpad API and safely handling its result.
    func fetchPlaylists() {
        
        NetworkManager.shared.fetchPlaylists { [weak self] result in
            guard let self = self else { return }
            
            // Removing previous data in case there was an error loading and the user wants to try again.
            self.playlists.removeAll(keepingCapacity: true)
            self.albums.removeAll(keepingCapacity: true)
            self.filterredAlbums.removeAll(keepingCapacity: true)
            
            // Rx: the change in data will provoke changes in the UI, so I call the Main thread.
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.playlists = response.playlists
                    self.albums = response.albums
                case .failure(let error):
                    print(error.rawValue)
                }
            }
        }
    }
    
    /// This function filters the albums obtained from the Showpad API to  The result of my network call to Showpad's API returns
    func filterAlbums(for playlist: Playlist) -> [Album] {
        var filterredAlbums: [Album] = []
        for album in albums {
            if playlist.albums.contains(album.id) {
                filterredAlbums.append(album)
            }
        }
        return filterredAlbums
    }
}
