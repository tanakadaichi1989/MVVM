//
//  ProductsView.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

struct ProductsView: View {
    var products: [Product]
    var body: some View {
        ForEach(products) { product in
            ProductRowView(product: product)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var data = ProductViewModel()
    static var previews: some View {
        ProductsView(products: data.products)
            .environmentObject(data)
    }
}
