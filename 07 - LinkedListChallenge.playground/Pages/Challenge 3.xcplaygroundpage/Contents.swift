// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 3: Reverse a linked list
 
 Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
 */
import UIKit

extension LinkedList {
    
    // straightforward memory consuming
    mutating func reverse() {
        let array = self
        head = nil
        array.forEach { push($0) }
    }
    
    // straightforward memory consuming
    mutating func reverseTmpList() {
        var tmpList = LinkedList<Value>()
        for value in self {
            tmpList.push(value)
        }
        head = tmpList.head
    }
    
    // memory efficient
    mutating func reverseMemoryEfficient() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}

var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)

list.reverse()
print(list)
list.reverseTmpList()
print(list)
list.reverseMemoryEfficient()
print(list)

Task {
    let d1 = duration { list.reverse() }
    try await Task.sleep(nanoseconds: 500_000_000)
    let d2 = duration { list.reverseTmpList() }
    try await Task.sleep(nanoseconds: 500_000_000)
    let d3 = duration { list.reverseMemoryEfficient() }
    print(d1/d2)
    print(d1/d3)
}
//: [Next Challenge](@next)
