//
//  ContentView.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @State private var showRegisterProductView = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing ) {
                ScrollView {
                    if productViewModel.products.count > 0 {
                        ProductsView(products: productViewModel.products)
                            .padding()
                            .frame(width: 300,alignment: .leading)
                    } else {
                        Text("商品を登録しましょう")
                    }
                }
                .padding(20)
                
                Button {
                    showRegisterProductView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .padding()
                }
                .background(Color(.systemBlue))
                .foregroundColor(Color.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showRegisterProductView) {
                    RegisterProductView()
                }
                
                Spacer()
            }
            .navigationBarTitle("商品一覧",displayMode: .inline)
            .navigationBarItems(trailing: alert)
        }
    }
    
    private var alert: some View {
        Button {
            self.show()
        } label: {
            Image(systemName: "trash")
        }
        .alert("確認",isPresented: $showAlert){
            Button {
                self.showAlert.toggle()
            } label: {
                Text("いいえ")
            }
            Button {
                self.productViewModel.deleteAll()
            } label: {
                Text("はい")
            }
        } message: {
            Text("全ての商品を削除しますか？")
        }
        .disabled(self.productViewModel.products.isEmpty ? true : false)
    }
    
    private func show() {
        self.showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ProductViewModel())
    }
}
