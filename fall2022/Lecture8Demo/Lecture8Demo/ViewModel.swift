//
//  SwiftUIView.swift
//  Lecture8Demo
//
//  Created by Andy Huang on 11/2/22.
//

import SwiftUI
import Firebase
class ViewModel: ObservableObject {
    @Published var userIsLoggedIn: Bool
    @Published var shoppingList: [ShoppingListItem]
    
    init() {
        self.userIsLoggedIn = false
        self.shoppingList = [ShoppingListItem]()
    }
    
    // Registers a user.
    func register(email: String, password: String) {
        // Add any password or username constraints here.
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            // Begin Completion Handler
            if let err = error {
                // Error exists.
                print(err.localizedDescription)
                return
            }
            
            // At this point the user has successfully registered. Can do anything you want here after the user has registered.
            
            // Use this if you want to get the user's id to create a db entry for the user's data.
            // var userID = result?.user.uid ?? ""
        }
    }
    
    // Logs in a user
    func login(email: String, password: String) {
        // Log the user in with Firebase.
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            // Begin Completion Handler
            if let err = error {
                // Error exists, could not sign the user in. (Alternatively, could trigger an alert from here.)
                print(err.localizedDescription)
                return
            }
            
            // At this point, the user has successfully logged in. Load user's data.
            self.userIsLoggedIn = true
            self.fetchShoppingList()
            
            // Use this if you want to get the user's id to fetch the user's data from the db.
            // var userID = result?.user.uid ?? ""
        }
    }
    
    // Signs the user out.
    func signOut() {
        // Only log the user out if they are logged in.
        if (!userIsLoggedIn) {
            print("No user logged in.")
            return
        }
        
        // Wrap inside a do block to catch errors.
        do {
            try Auth.auth().signOut()
            userIsLoggedIn = false
        // Catch error instead of crashing if log out fails.
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    // Get Shopping list items
    func fetchShoppingList() {
        // Clear the shopping list because we will fill it up with the items from the database.
        shoppingList.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("ShoppingList")
        ref.getDocuments { snapshot, error in
            // Begin Completion Handler
            if let err = error {
                // Error exists.
                print(err.localizedDescription)
                return
            }
            
            // Check if documents exist in the database.
            if let snap = snapshot {
                // Loop over each document in the ShoppingList collection.
                for doc in snap.documents {
                    // Retreive the document data.
                    let data = doc.data()
                    // Get data about the item.
                    let id = data["id"] as? String ?? ""
                    let itemName = data["itemName"] as? String ?? ""
                    let quantity = data["quantity"] as? String ?? ""
                    
                    // Add the item to the shoppingList.
                    let item = ShoppingListItem(id: id, itemName: itemName, quantity: quantity)
                    self.shoppingList.append(item)
                }
            }
        }
    }
    
    // Add an item to the shopping list
    func addShoppingListItem(newItem: ShoppingListItem) {
        let db = Firestore.firestore()
        
        // Specify the document with its id that you want to add or modify.
        let ref = db.collection("ShoppingList").document(newItem.itemName)
        
        // Add or modify the document to the database.
        ref.setData(["itemName": newItem.itemName, "quantity": newItem.quantity, "id": newItem.id])
        
        // Add the item to the shopping list.
        self.shoppingList.append(newItem)
    }
}
