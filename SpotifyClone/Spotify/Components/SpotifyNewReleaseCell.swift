//
//  SpotifyNewReleaseCell.swift
//  SpotifyClone
//
//  Created by BSTAR on 12/12/2025.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New releases from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    var onAddToPlaylist: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(
                    urlString: imageName,
                )
                .frame(width: 50, height: 50)
                .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline.capitalized)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack {
                
                ImageLoaderView(
                    urlString: imageName,
                )
                .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        
                        if let title {
                            Text(title)
                                .foregroundStyle(.spotifyWhite)
                                .font(.callout)
                                .fontWeight(.semibold)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                                .font(.callout)
                                .lineLimit(2)
                        }
                        
                    }
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylist?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.trailing, 16)
                .padding(.vertical, 10)
                
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
    
}

#Preview {
    ZStack {
        
        Color.black
            .ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding()
    }
}
