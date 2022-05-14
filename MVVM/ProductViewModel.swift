//
//  Data.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products:[Product] = [Product]()
    private let service = ProductService()
    
    init() {
        service.fetch { products in
            self.products = Array(products)
        }
    }
    
    func getProducts(completion: @escaping ([Product]) -> Void) {
        service.fetch { products in
            completion(Array(products))
        }
    }
    
    func add(_ product: Product) {
        service.add(product) { product in
            self.products.append(product)
        }
    }
    
    func deleteAll() {
        service.deleteAll { products in
            self.products = products
        }
    }
}
