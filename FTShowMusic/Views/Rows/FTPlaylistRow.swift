//
//  FTPlaylistRow.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import SwiftUI

struct FTPlaylistRow: View {
    
    var playlist: Playlist
    var albums: [Album] // These albums have already been filterred in the view model.
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(playlist.title)
                .font(.system(size: 18))
                .bold()
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(albums, id: \.id) { album in
                        FTAlbumCell(album: album)
                    }
                }
            }
        }
    }
}

struct FTPlaylistRow_Previews: PreviewProvider {
    static var previews: some View {
        FTPlaylistRow(playlist: MockData.coldplayPlaylist, albums: [MockData.parachutes])
    }
}
