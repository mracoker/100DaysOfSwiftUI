/*: [<< Previous](@previous)       [Next >>](@next)
# Closures
Checkpoint 5
*/

import Foundation

//checkpint 5
/*
 -Filter out any numbers that are even
 -Sort the array in ascending order
 -Map them to strings in the format "7 is a lucky number"
 -Print out the array, one item per line
 -No temp variables, call filter, sort and map one after the other in a chain
 */
var luckyNumbers = [7,4,38,21,16,15,12,33,31,49]

luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $0 < $1 }.map { "\($0) is a lucky number" }.forEach { print($0) }

//attempt before hints
/*
 func checkpointFilter(numbers: [Int], filterOdd: ([Int]) -> [Int], sort: ([Int]) -> [Int], map: ([Int]) -> [String], print: ([String]) -> Void) -> Void {
 var newNumbers = filterOdd(numbers)
 sort(newNumbers)
 map(newNumbers)
 print(newNumbers)
 //return print(map(sort(filterOdd(numbers))))
 //return filterOdd(sort(map(numbers)))
 }
 checkpointFilter(numbers: luckyNumbers) { (numbers: [Int]) in
 numbers.filter { $0.isMultiple(of: 2) }
 } sort: { (numbers: [Int]) in
 numbers.sorted { $0 > $1 }
 } map: { (numbers: [Int]) in
 numbers.map { "\($0) is a lucky number" }
 } print: { (numbers: [String]) in
 
 }
 */
