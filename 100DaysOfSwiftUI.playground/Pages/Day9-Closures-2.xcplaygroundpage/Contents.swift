/*: [<< Previous](@previous)       [Next >>](@next)
# Trailing Closures & Shorthand Syntax
*/
import Foundation

let team = ["Tom", "Dick", "Harry", "Albert", "Addison", "Carly", "Connor", "Sarah"]
print(team.sorted())

let sorted1 = team.sorted(by: { (a: String, b: String) -> Bool in
    let captain = "Sarah"
    
    if a == captain {
        return true
    } else if b == captain {
        return false
    }
    
    return a < b
})
print(sorted1)

//since the sort knows it must take in 2 string and return a bool
let sorted2 = team.sorted(by: { a, b in
    let captain = "Sarah"
    
    if a == captain {
        return true
    } else if b == captain {
        return false
    }
    
    return a < b
})
print(sorted2)

//trailing closure syntax
let sorted3 = team.sorted { a, b in
    let captain = "Sarah"
    
    if a == captain {
        return true
    } else if b == captain {
        return false
    }
    
    return a < b
}
print(sorted3)

//don't use param names and use default $0...$999
//but not recommended if $0-$999 is used more than once
let sorted4 = team.sorted {
    let captain = "Sarah"
    
    if $0 == captain {
        return true
    } else if $1 == captain {
        return false
    }
    
    return $0 < $1
}
print(sorted4)

let reverseTeam1 = team.sorted {
    return $0 > $1
}

//don't use shorthand if
//1. the closure body is long
//2. if the params are used multiple times in the closure
//3. if there are 3 or more params
let reverseTeam2 = team.sorted { $0 > $1 }
print(reverseTeam2)

//filter will loop through all elements and only
//return elements that pass our test
let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

//map will loop through all elements and transform them
let ucaseTeam = team.map { $0.uppercased() }
print(ucaseTeam)
