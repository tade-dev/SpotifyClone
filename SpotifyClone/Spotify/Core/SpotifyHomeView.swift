//
//  SpotifyHomeView.swift
//  SpotifyClone
//
//  Created by BSTAR on 12/12/2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: SpotifyCategory = .all
    @State private var products: [ProductElement] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack {
                
            Color.spotifyBlack
                .ignoresSafeArea()
                
            ScrollView(.vertical) {
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                        VStack {
                            recentSections
                                .padding(.horizontal, 16)
                            
                            if let product = products.first {
                                newReleaseView(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRow
                            
                        }
                        
                        
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                }
                .padding(.top, 8)
                
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        }
        .navigationBarBackButtonHidden()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProduct().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
//                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            
            ZStack {
                if let currentUser {
                    ImageLoaderView(
                        urlString: currentUser.image
                    )
                    
                    .background(Color.white)
                    .clipShape(.circle)
                    .onTapGesture {
                        
                    }
                }
            }
            .frame(width: 35, height: 35)
        
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(SpotifyCategory.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.leading, 16)
            }
            .scrollIndicators(.hidden)
            
            
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    private var recentSections: some View {
        NonLazyVGrid(
            columns: 2,
            alignment: .center,
            spacing: 10,
            items: products) { product in
                SpotifyRecentCell(
                    imageName: product?.firstImage ?? "",
                    title: product?.title ?? ""
                )
                .asButton(.press) {
                    
                }
            }
    }
    
    private func newReleaseView(product: ProductElement) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category.rawValue,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylist: {
                
            },
            onPlayPressed: {
                
            }
        )

    }
    
    private var listRow : some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(
                                imageName: product.firstImage, size: 120, title: product.title
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
}


#Preview {
    SpotifyHomeView()
}
