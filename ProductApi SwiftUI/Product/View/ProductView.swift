//
//  ProductView.swift
//  ProductApi SwiftUI
//
//  Created by Harsh Prajapat on 05/07/24.
//

import SwiftUI

struct ProductViewItem: View {
    
    let product: ProductViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.image)) { img in
                img.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.headline)
                Text("$\(product.price)")
                    .font(.headline)
                Text(product.description)
                    .font(.footnote)
                    .lineLimit(3)
            }
        }
    }
}

struct ProductView: View {
    
    @StateObject private var productListVM = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            List(productListVM.products, id: \.id) { product in
                ProductViewItem(product: product)
            }
            .listStyle(.plain)
            .onAppear {
                productListVM.getProducts()
            }
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ProductView()
}
