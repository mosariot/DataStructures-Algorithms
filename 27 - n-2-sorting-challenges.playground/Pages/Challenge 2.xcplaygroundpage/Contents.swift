// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 2: Find a duplicate
//: Given a collection of Equatable elements, return the first element
//: that is a duplicate in the collection.

extension Sequence where Element: Hashable {
    
    var firstDuplicate: Element? {
        var uniqueElements: Set<Element> = []
        var currentCount = 0
        for element in self {
            uniqueElements.insert(element)
            currentCount += 1
            if uniqueElements.count < currentCount {
                return element
            }
        }
        return nil
    }
}

let array = [2, 4, 5, 5, 2]
array.firstDuplicate

//: [Next Challenge](@next)
