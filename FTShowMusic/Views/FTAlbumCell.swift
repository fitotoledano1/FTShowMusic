//
//  FTAlbumCell.swift
//  FTShowMusic
//
//  Created by Fito Toledano on 2/11/21.
//

import SwiftUI

struct FTAlbumCell: View {
    
    var album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageWithURL(album.imageUrl)
            Text(album.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct FTAlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        FTAlbumCell(album: MockData.parachutes)
    }
}
