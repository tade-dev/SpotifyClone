//
//  ContentView.swift
//  SpotifyClone
//
//  Created by BSTAR on 12/12/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [ProductElement] = []
    
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(products) { product in
                    Text("\(product.title)")
                        .foregroundStyle(.spotifyGreen)
                }
                
            }
            .padding()
            .task {
                await getData()
            }
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProduct()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
