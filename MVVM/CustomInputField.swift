//
//  CustomInputField.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

struct CustomInputField: View {
    let placeholderText: String
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField(placeholderText,text: $text)
            Divider()
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(placeholderText: "Sample", text: Binding.constant("Sample"))
    }
}
