//
//  formDemo.swift
//  lecture6Demo
//
//  Created by Andy Huang on 10/19/22.
//

import SwiftUI

struct formDemo: View {
    var array: [String] = ["a", "b", "c"]
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("For each")) {
                    ForEach(array, id: \.self) { letter in
                        Button(letter) {}
                    }
                }
                
                Group {
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                    Text("Blah")
                }
            }
        }
    }
}

struct formDemo_Previews: PreviewProvider {
    static var previews: some View {
        formDemo()
    }
}
