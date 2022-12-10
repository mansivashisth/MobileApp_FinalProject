//
//  MyToDoAppApp.swift
//  MyToDoApp
//
//  Created by Mansi Vashisth on 11/28/22.
//

import SwiftUI

@main
struct MyToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
