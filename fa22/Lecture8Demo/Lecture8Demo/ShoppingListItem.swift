//
//  ShoppingListItem.swift
//  Lecture8Demo
//
//  Created by Andy Huang on 11/2/22.
//

import SwiftUI


struct ShoppingListItem: Identifiable {
    var id: String = UUID().uuidString
    var itemName: String
    var quantity: String
}
