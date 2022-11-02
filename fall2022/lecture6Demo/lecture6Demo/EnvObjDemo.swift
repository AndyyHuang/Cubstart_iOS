//
//  EnvObjDemo.swift
//  lecture6Demo
//
//  Created by Andy Huang on 10/19/22.
//

import SwiftUI

class Pet: ObservableObject {
    @Published var animal: String
    @Published var name: String
    @Published var age: Int
    var imageName: String
    
    init(animalType: String, petName: String, petAge: Int, imageName: String) {
        self.animal = animalType
        self.name = petName
        self.age = petAge
        self.imageName = imageName
    }
    
    func incrementAge() {
        self.age += 1
        print(self.age)
    }
}

struct displayPetView: View {
    @EnvironmentObject var myPet: Pet
    var body: some View {
        VStack {
            Text("\(myPet.animal), \(myPet.name), \(myPet.age)")
                .padding()
            
            Image(myPet.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Button("Increment age") {
                myPet.incrementAge()
            }
        }
    }
}

struct EnvObjDemo: View {
    @StateObject var pet = Pet(animalType: "Capybara", petName: "Bella", petAge: 1, imageName: "capybara")
    
    var body: some View {
        VStack {
            displayPetView()
        }
        .environmentObject(pet)
    }
}

struct EnvObjDemo_Previews: PreviewProvider {
    static var previews: some View {
        EnvObjDemo()
    }
}
