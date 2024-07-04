//
//  ProductViewModel.swift
//  ProductApi SwiftUI
//
//  Created by Harsh Prajapat on 05/07/24.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products: [ProductViewModel] = []
    
    func getProducts() {
        NetworkManager.shared.fetchProducts { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products.map(ProductViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

struct ProductViewModel: Identifiable {
    
    var product: Product
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
    
    var description: String {
        product.description
    }
    
    var image: String {
        product.image
    }
    
}
