//
//  Lecture8DemoApp.swift
//  Lecture8Demo
//
//  Created by Andy Huang on 11/2/22.
//

import SwiftUI
import Firebase

@main
struct Lecture8DemoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
