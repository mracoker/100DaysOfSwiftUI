/*: [<< Previous](@previous)       [Next >>](@next)
# Closures
How to write functions that accept other functions as parameters.
*/

import Foundation

let maxDiceNumber = 6
let timesToRoll = 15

//parameter function does not accept any parameters itself
func makeArrayOrig(size: Int, diceRoller generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}
//first try at it, notice now we don't have to use diceRoller:
/*
var rollsOrig = makeArrayOrig(size: timesToRoll, diceRoller: {
    Int.random(in: 1...maxDiceNumber)
})*/
//second, copied from video
var rollsOrig = makeArrayOrig(size: timesToRoll) {
    Int.random(in: 1...maxDiceNumber)
}
print(rollsOrig)

//parameter function now accepts a parameter itself
func makeArrayMod(size: Int, diceRoller generator: (Int) -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator(maxDiceNumber)
        numbers.append(newNumber)
    }
    
    return numbers
}

var rollsMod = makeArrayMod(size: timesToRoll) { (mdn: Int) in
    Int.random(in: 1...mdn)
}
print(rollsMod);

//didn't use a label for our generator function
//uses 2 input function parameters
func makeArrayMod0(size: Int, generator: (Int) -> Int, doneMessage: () -> Void) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator(maxDiceNumber)
        numbers.append(newNumber)
    }
    
    doneMessage()
    
    return numbers
}

//multiple closures called
var rollsMod0 = makeArrayMod0(size: timesToRoll) { (mdn: Int) in
    //first closure
    Int.random(in: 1...mdn)
} doneMessage: {
    //second closure
    print("All done, here is your array:")
    //print(rollsMod0)
}
print(rollsMod0)
