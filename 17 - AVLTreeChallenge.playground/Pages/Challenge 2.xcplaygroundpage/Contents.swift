// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 
 ## Challenge 2
 
 How many **nodes** are there in a perfectly balanced tree of height 3? What about a perfectly balanced tree of height `h`?
 */
import Darwin

func nodes(inTreeOfHeight height: Int) -> Int {
    var nodes = 0
    for i in 0...height {
         nodes += Int(pow(2, Double(i)))
    }
    return nodes
}

func nodesFaster(inTreeOfHeight height: Int) -> Int {
    Int(pow(2, Double(height + 1))) - 1
}

nodes(inTreeOfHeight: 3)
nodesFaster(inTreeOfHeight: 3)
//: [Next Challenge](@next)
