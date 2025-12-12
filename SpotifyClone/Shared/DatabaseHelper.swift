//
//  DatabaseHelper.swift
//  SpotifyClone
//
//  Created by BSTAR on 12/12/2025.
//

import Foundation

struct DatabaseHelper {
    
    func getProduct() async throws -> [ProductElement] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try JSONDecoder().decode(Product.self, from: data)
        
        return products.products
        
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let users = try JSONDecoder().decode(Users.self, from: data)
        
        return users.users
        
    }
    
}
