//
//  SpotifyCategoryCell.swift
//  SpotifyClone
//
//  Created by BSTAR on 12/12/2025.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "Music"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(
                isSelected ?
                    .spotifyGreen :
                        .spotifyDarkGray
            )
            .foregroundStyle(
                isSelected ?
                    .spotifyBlack :
                        .spotifyWhite
            )
            .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Music", isSelected: true)
            SpotifyCategoryCell(title: "I am active")
            SpotifyCategoryCell(title: "I am active", isSelected: true)
        }
    }
}
