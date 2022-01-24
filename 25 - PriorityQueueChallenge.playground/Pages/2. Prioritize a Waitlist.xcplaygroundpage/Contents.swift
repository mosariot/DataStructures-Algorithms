// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 2. Prioritize a Waitlist
 
 Your favorite T-Swift concert was sold out. Fortunately there is a waitlist for people who still want to go! However the ticket sales will first prioritize someone with a **military background**, followed by **seniority**. Write a `sort` function that will return the list of people on the waitlist by the priority mentioned.
 */

public struct Person: Equatable {
    let name: String
    let age: Int
    let isMilitary: Bool
}

extension Person: Comparable {
    
    public static func < (lhs: Person, rhs: Person) -> Bool {
        if lhs.isMilitary && rhs.isMilitary {
            return lhs.age < rhs.age
        }
        if lhs.isMilitary && !rhs.isMilitary {
            return false
        } else {
            return true
        }
    }
    
    // book version
//    public static func < (lhs: Person, rhs: Person) -> Bool {
//        if lhs.isMilitary == rhs.isMilitary {
//            return lhs.age < rhs.age
//        }
//        return !lhs.isMilitary
//    }
}

let persons = [Person(name: "Alex", age: 21, isMilitary: false),
               Person(name: "John", age: 24, isMilitary: true),
               Person(name: "Ivan", age: 18, isMilitary: true),
               Person(name: "Mulder", age: 35, isMilitary: false),
               Person(name: "Scully", age: 40, isMilitary: true),
               Person(name: "Lev", age: 55, isMilitary: true)]
var priorityQueue = PriorityQueue<Person>(sort: >, elements: persons)
while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}
