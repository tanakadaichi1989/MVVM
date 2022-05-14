//
//  ProductService.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import Foundation
import RealmSwift

class ProductService {
    private static var config = Realm.Configuration(schemaVersion: 1)
    private static var realm = try! Realm(configuration: config)
    
    func fetch(completion: (Results<Product>) -> Void) {
        let result = ProductService.realm.objects(Product.self)
        completion(result)
    }
    
    func add(_ product: Product, completion: @escaping (Product) -> Void) {
        try! ProductService.realm.write {
            ProductService.realm.add(product)
        }
        completion(product)
    }
    
    func deleteAll(completion: ([Product]) -> Void) {
        try! ProductService.realm.write {
            ProductService.realm.deleteAll()
        }
        self.fetch { products in
            completion(Array(products))
        }
    }
}
