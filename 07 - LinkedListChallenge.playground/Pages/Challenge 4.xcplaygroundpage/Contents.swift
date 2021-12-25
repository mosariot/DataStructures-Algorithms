// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 4: Merge two lists
 
 Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
 */
import UIKit

// straightforward memory consuming
@discardableResult
func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
    
    let overall = (Array(left) + Array(right)).sorted()
    var list = LinkedList<T>()
    for value in overall {
        list.append(value)
    }
    return list
}

// memory and time efficient
@discardableResult
func mergeSortedMemoryEfficient<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else { return right }
    guard !right.isEmpty else { return left }
    
    var resultList = LinkedList<T>()
    
    var currentLeft = left.head
    var currentRight = right.head
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            resultList.append(leftNode.value)
            currentLeft = leftNode.next
            continue
        }
        if leftNode.value > rightNode.value {
            resultList.append(rightNode.value)
            currentRight = rightNode.next
            continue
        }
        if leftNode.value == rightNode.value {
            resultList.append(leftNode.value)
            resultList.append(rightNode.value)
            currentLeft = leftNode.next
            currentRight = rightNode.next
        }
    }
    
    if let leftNodes = currentLeft {
        resultList.tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        resultList.tail?.next = rightNodes
    }
    
    return resultList
}

// memory and time efficient
@discardableResult
func mergeSortedBookEdition<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else { return right }
    guard !right.isEmpty else { return left }
    
    var newHead: Node<T>?
    
    var tail: Node<T>?
    var currentLeft = left.head
    var currentRight = right.head
    
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next
    }
    
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    var list = LinkedList<T>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    
    return list
}

var left = LinkedList<Int>()
left.append(1)
left.append(3)
left.append(8)
left.append(26)

var right = LinkedList<Int>()
right.append(6)
right.append(10)
right.append(15)
right.append(25)
right.append(46)
right.append(48)

let mergeSortedList = mergeSorted(left, right)
print(mergeSortedList)

Task {
    let d1 = duration { mergeSorted(left, right) }
    try await Task.sleep(nanoseconds: 150_000_000)
    let d2 = duration { mergeSortedMemoryEfficient(left, right) }
    print(d1/d2)
    try await Task.sleep(nanoseconds: 150_000_000)
    let d3 = duration { mergeSortedBookEdition(left, right) }
    print(d1/d3)
}

//: [Next Challenge](@next)
