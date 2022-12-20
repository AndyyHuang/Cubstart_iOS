//
//  EnvObjDemo.swift
//  lecture6LiveDemo
//
//  Created by Andy Huang on 10/20/22.
//

import SwiftUI

class Pet: ObservableObject {
    @Published var animal: String
    @Published var name: String
    var age: Int
    var imageName: String
    @Published var update: Bool
    
    init(animalType: String, animalName: String, animalAge: Int, imageName: String) {
        self.animal = animalType
        self.name = animalName
        self.age = animalAge
        self.imageName = imageName
        self.update = false
    }
}

struct EnvObjDemo: View {
    @StateObject var myPet: Pet = Pet(animalType: "capybara", animalName: "bella", animalAge: 1, imageName: "capybara")
    
    var body: some View {
        VStack {
            displayPetView()
        }
        .environmentObject(myPet)
    }
}

struct displayPetView: View {
    @EnvironmentObject var myPet: Pet
    var body: some View {
        VStack {
            HStack {
                Text(myPet.animal)
                Text(myPet.name)
                Text(String(myPet.age))
            }
            
            Image(myPet.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button("Increment Age") {
                myPet.age += 1
            }
            
            Button("Update") {
                myPet.update.toggle()
            }
        }
    }
}

struct EnvObjDemo_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjDemo()
    }
}
