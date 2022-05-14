//
//  MVVMApp.swift
//  MVVM
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI
import RealmSwift

@main
struct MVVMApp: SwiftUI.App {

    @StateObject var viewModel = ProductViewModel()
    
    init(){
        print("DEBUG: App launched ...")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
