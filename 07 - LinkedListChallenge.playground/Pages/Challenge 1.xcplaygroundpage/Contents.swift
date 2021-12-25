// Copyright (c) 2021 Razeware LLC

// For full license & permission details, see LICENSE.markdown.
/*:
 # Linked List Challenges
 ## Challenge 1: Print in reverse
 
 Create a function that prints the nodes of a linked list in reverse order.
 */
import UIKit

// straightforward memory consuming
func printInReverse<T>(_ list: LinkedList<T>) {
    list.reversed().forEach { print($0) }
}

// memory efficient
func printInReverseRecursiveVersion<T>(_ list: LinkedList<T>) {
    printInReverse(list.head)
}

private func printInReverse<T>(_ node: Node<T>?) {
    guard let node = node else { return }
    printInReverse(node.next)
    print(node.value)
}

var list = LinkedList<Int>()
list.append(1)
list.append(2)
list.append(3)

Task {
    let d1 = duration { printInReverse(list) }
    try await Task.sleep(nanoseconds: 150_000_000)
    let d2 = duration { printInReverseRecursiveVersion(list) }
    print(d1/d2)
}
//: [Next Challenge](@next)
