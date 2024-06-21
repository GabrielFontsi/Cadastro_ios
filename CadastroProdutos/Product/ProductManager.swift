//
//  ProductManager.swift
//  CadastroProdutos
//
//  Created by Gabriel Fontenele da Silva on 20/06/24.
//

import Foundation

class ProductManager {
    static let shared = ProductManager()
    private init() {}
    
    private var products: [Product] = []
    
    func addProduct(_ product: Product) {
        products.append(product)
        sortProducts()
    }
    
    func getProducts() -> [Product] {
        return products
    }
    
    private func sortProducts() {
        products.sort { $0.price < $1.price }
    }
}
