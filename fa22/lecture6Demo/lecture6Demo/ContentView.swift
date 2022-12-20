//
//  ContentView.swift
//  lecture6Demo
//
//  Created by Andy Huang on 10/19/22.
//

import SwiftUI

struct modifyProfileView: View {
    @Binding var age: Int
    @Binding var name: String
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 250)
            
            TextField("Enter your age", value: $age, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 250)
        }
        .navigationTitle("Edit Profile")
    }
}


struct ContentView: View {
    @State var age: Int = 31
    @State var name: String = "Andy"
    var body: some View {
        NavigationView {
            VStack{
                Text("Name: \(name)")
                Text("Age: \(age)")
                
                NavigationLink(destination: modifyProfileView(age: $age, name: $name)){
                    Text("Edit Profile")
                    
                }
                .padding()
            }
            .navigationTitle("Content View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
