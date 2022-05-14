//
//  ProductRowView.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

struct ProductRowView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(product.name)
                    .fontWeight(.heavy)
                Text(String("￥\(product.price) -"))
                    .fontWeight(.heavy)
            }
            Text(product.memo)
                .font(.subheadline)
            Divider()
        }
    }
}

struct ProductRowView_Pproduct: PreviewProvider {
    static var data = ProductViewModel()
    static var product = Product(name: "綾鷹", price: 100, memo: "ベストセラー")
    static var previews: some View {
        ProductRowView(product: product)
            .environmentObject(data)
    }
}
