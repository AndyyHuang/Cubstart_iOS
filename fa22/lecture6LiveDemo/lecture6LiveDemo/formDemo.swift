//
//  formDemo.swift
//  lecture6LiveDemo
//
//  Created by Andy Huang on 10/20/22.
//

import SwiftUI

struct formDemo: View {
    var body: some View {
        Form {
            Section(header: Text("section1")) {
                Text("Hi")
                Text("Hello")
                Text("Hi")
            }
            
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }
    }
}

struct formDemo_Previews: PreviewProvider {
    static var previews: some View {
        formDemo()
    }
}
