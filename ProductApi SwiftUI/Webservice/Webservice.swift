//
//  Webservice.swift
//  ProductApi SwiftUI
//
//  Created by Harsh Prajapat on 05/07/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case message(_ error: Error?)
}

typealias Handler = (Result<[Product], NetworkError>) -> Void

class NetworkManager {
    
    static let shared = NetworkManager()
    
    init(){}
    
    func fetchProducts(completion: @escaping Handler) {
        
        guard let url = URL(string: API.products) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.message(error)))
            }
            
        }.resume()
        
    }
    
}


class APIManager {
    
    static let shared = APIManager()
    
    private init(){}
    
    func fetchProducts(completion: @escaping Handler) {
        // code
    }
    
}
