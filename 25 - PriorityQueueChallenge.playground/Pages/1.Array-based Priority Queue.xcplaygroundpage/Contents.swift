
// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Priority Queue Challenges
 ## 1. Array-based Priority Queue
 You know how to use a heap to construct a priority queue by conforming
 to the `Queue` protocol. Now construct a priority queue using an `Array`.
 */

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct PriorityQueueArrayBased<Element: Equatable>: Queue {
    
    private var array: Array<Element> = []
    private var sort: (Element, Element) -> Bool
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.array = elements.sorted(by: sort)
        self.sort = sort
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: Element? {
        array.first
    }
    
    public mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        array.sort(by: sort)
        return true
    }
    
    public mutating func enqueueBookVersion(_ element: Element) -> Bool {
        for (index, otherElement) in array.enumerated() {
            if sort(element, otherElement) {
                array.insert(element, at: index)
                return true
            }
        }
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        array.removeFirst()
    }
}

var priorityQueue = PriorityQueueArrayBased(sort: >, elements: [1,12,3,4,1,6,8,7])
priorityQueue.enqueue(5)
priorityQueue.enqueue(0)
priorityQueue.enqueue(10)
while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}

//: [Next Challenge](@next)
