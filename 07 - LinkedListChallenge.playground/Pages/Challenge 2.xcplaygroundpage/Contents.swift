// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 2: Find the middle node
 
 Create a function that finds the middle node of a linked list.
 */
import UIKit

@discardableResult
func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    let index = Int(Double(list.count)/2.rounded(.up))
    return list.node(at: index)
}

@discardableResult
func getMiddleRunnersTechnique<T>(_ list: LinkedList<T>) -> Node<T>? {
    var slow = list.head
    var fast = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    
    return slow
}

var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)
list.append(4)

let node = getMiddle(list)
let node2 = getMiddleRunnersTechnique(list)
print(node?.value ?? "no value")
print(node2?.value ?? "no value")

Task {
    let d1 = duration { getMiddle(list) }
    try await Task.sleep(nanoseconds: 150_000_000)
    let d2 = duration { getMiddleRunnersTechnique(list) }
    print(d1/d2)
}
//: [Next Challenge](@next)
