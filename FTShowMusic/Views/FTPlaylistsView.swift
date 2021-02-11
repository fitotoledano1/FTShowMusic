//
//  ContentView.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import SwiftUI

struct FTPlaylistsView: View {
    
    @StateObject var viewModel = FTPlaylistsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.playlists, id: \.id) { playlist in
                    // Each row contains a playlist, and its filterred albums.
                    FTPlaylistRow(playlist: playlist,
                                  albums: viewModel.filterAlbums(for: playlist))
                }
            }
            .navigationTitle("Playlists")   
        }.onAppear {
            viewModel.fetchPlaylists()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FTPlaylistsView()
    }
}
