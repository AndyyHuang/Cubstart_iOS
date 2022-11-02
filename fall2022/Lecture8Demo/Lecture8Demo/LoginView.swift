//
//  LoginView.swift
//  Lecture8Demo
//
//  Created by Andy Huang on 11/2/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .padding()
                
                // Use SecureField in practice, it is a TextField right now for demo purposes.
                TextField("Password", text: $password)
                    .padding()
                
                Button("Login") {
                    viewModel.login(email: email, password: password)
                }
                
                .padding()
                
                Button("Register") {
                    viewModel.register(email: email, password: password)
                }
            }
            .navigationTitle("Register")
        }
    }
}
