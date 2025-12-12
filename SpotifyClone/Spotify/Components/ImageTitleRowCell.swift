//
//  ImageTitleRowCell.swift
//  SpotifyClone
//
//  Created by BSTAR on 12/12/2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageName: String = Constants.randomImage
    var size: CGFloat = 100
    var title: String = "Chris Brown Maurie"
    
    var body: some View {
        VStack {
            
            ImageLoaderView(
                urlString: imageName
            )
            .frame(width: size, height: size)
            
            Text(title)
                .foregroundStyle(.spotifyLightGray)
                .font(.callout)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: size)
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        
        ImageTitleRowCell()
    }
}
