//
//  Product.swift
//  ProductApi SwiftUI
//
//  Created by Harsh Prajapat on 05/07/24.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
}
