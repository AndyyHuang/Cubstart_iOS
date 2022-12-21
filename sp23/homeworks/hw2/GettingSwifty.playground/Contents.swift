class Swifty {
    let trees = ["Oak", "Maple", "Birch", "Redwood", "Sequoia", "Spruce", "Evergreen", "Willow", "Bonsai"]
    var visited: [String]
    var energy: Float
    
    // Constructor
    init() {
        // Swifty lives on a Bonsai tree!
        self.visited = ["Bonsai"]
        self.energy = 300
    }
    
    /* Task 1: Explore
        - If energy is less than 20, then don't visit any tree.
        - Else if the tree is a Redwood OR Sequoia, then decrease energy by 20 and add the tree to visited.
        - Otherwise, for all other trees, decrease energy by 10 and add the tree to visited.
    */
    func visitRandomTree() -> Void {
        var randomTree = trees.randomElement()!
        // TODO: CODE HERE
        
        if (energy < 20) {
            return
        } else if ( ... ) {
            
        } else {
            
        }
    }
    
    /* Task 2: Rest
        - Recover 100 energy, but make sure energy does not go past 300!
    */
    func rest() -> Void {
        // TODO: CODE HERE
    }
    
    /* Task 3: Homesick
        - Remember to only increment the count if you see "Bonsai" in the visited array!
    */
    func homesickness() -> Int {
        var count = 0
        // TODO: CODE HERE
        for tree in visited {
            
        }
        return ...
    }
}
