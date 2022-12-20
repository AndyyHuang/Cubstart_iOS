//
//  shoppingListView.swift
//  Lecture8Demo
//
//  Created by Andy Huang on 11/2/22.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var addItemName: String = ""
    @State var addItemQuantity: String = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.shoppingList, id: \.id) { item in
                    HStack {
                        Text(item.itemName)
                        Spacer()
                        Text(String(item.quantity))
                    }
                }
                
                HStack {
                    TextField("ItemName", text:$addItemName)
                    Spacer()
                    TextField("Quantity", text:$addItemQuantity)
                }
                
                Button("Add New Item") {
                    viewModel.addShoppingListItem(newItem: ShoppingListItem(itemName: addItemName, quantity: addItemQuantity))
                }
            }
            .navigationTitle("Shopping List")
        }
    }
}
