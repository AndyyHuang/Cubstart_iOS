//
//  myapptestApp.swift
//  myapptest
//
//  Created by Andy Huang on 11/3/22.
//

import SwiftUI
import Firebase

@main
struct myapptestApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
