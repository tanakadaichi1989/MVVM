//
//  HeaderView.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

struct HeaderView: View {
    let title1: String
    let title2: String
    
    init(title1: String, title2: String){
        self.title1 = title1
        self.title2 = title2
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title1)
                .font(.title)
                .fontWeight(.semibold)
            Text(title2)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBlue))
        .foregroundColor(.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title1: "商品登録画面", title2: "商品を登録しましょう")
    }
}
