// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 5: Remove all occurrences of a specific element
 
 Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the `remove(at:)` method that you implemented for the linked list.
 */
import UIKit

extension LinkedList where Value: Equatable {
    
    mutating func removeAll(_ value: Value) {
        while let head = head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        
        while let currentNode = current {
            if currentNode.value == value {
                prev?.next = currentNode.next
                current = prev?.next
            } else {
                prev = prev?.next
                current = current?.next
            }
        }
        tail = prev
    }
}

var list = LinkedList<Int>()
list.append(3)
list.append(3)
list.append(1)
list.append(3)
list.append(3)
list.append(1)
list.append(26)
list.append(3)
list.append(1)
list.append(3)
list.append(3)

list.removeAll(3)
print(list)
