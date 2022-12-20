//
//  ContentView.swift
//  Lecture8Demo
//
//  Created by Andy Huang on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        if viewModel.userIsLoggedIn {
            ShoppingListView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
