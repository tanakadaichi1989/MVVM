//
//  Product.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import Foundation
import RealmSwift

final class Product: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: UUID = UUID()
    @Persisted var name: String
    @Persisted var price: Int
    @Persisted var memo: String
    
    override init(){}
    
    init(name: String, price: Int, memo: String){
        self.name = name
        self.price = price
        self.memo = memo
    }
}
