//
//  RegisterNewProductView.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

struct RegisterProductView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var productViewModel: ProductViewModel
    
    @State var name = ""
    @State var price = ""
    @State var memo = ""
    
    var body: some View {
        VStack {
            HeaderView(title1: "商品登録画面", title2: "商品を登録しましょう")
                .ignoresSafeArea()
        
            VStack {
                CustomInputField(placeholderText: "商品名", text: $name)
                CustomInputField(placeholderText: "価格", text: $price)
                CustomInputField(placeholderText: "備考", text: $memo)
            }
            .padding(30)
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("キャンセル")
                }
                .buttonStyle(.bordered)
                
                Button {
                    guard let price = Int($price.wrappedValue) else { return }
                    productViewModel.add(Product(name: name, price: price, memo: $memo.wrappedValue))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("商品を追加")
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
    }
}

struct RegisterNewProductView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterProductView()
    }
}
