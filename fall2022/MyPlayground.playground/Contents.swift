import UIKit
import SwiftUI
class Fruit {
    let name: String
    let color: String
    
    init(fruitName: String, color: String) {
        self.name = fruitName
        self.color = color
    }
}

var a_fruit = Fruit(fruitName: "apple", color: "red")
var another_fruit = Fruit(fruitName: "pineapple", color: "black")

print(a_fruit.name, a_fruit.color)
print(another_fruit.name, another_fruit.color)
