// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
/*:
 ## 3. Partitioning with Swift Standard Library
 
 Implement Quicksort using the `partition(by:)` function that is part of the Swift Standard Library.

 > For more information refer to Apple's documentation here: https://developer.apple.com/documentation/swift/array/3017524-partition

 */

extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {
    
    mutating func quicksort() {
        quicksortLomuto(low: startIndex, high: index(before: endIndex))
    }
    
    private mutating func quicksortLomuto(low: Index, high: Index) {
        if low <= high {
            let pivotValue = self[high]
            var p = self.partition { $0 > pivotValue }
            if p == endIndex { p = index(before: p) }
            self[..<p].quicksortLomuto(low: low, high: index(before: p))
            self[p...].quicksortLomuto(low: index(after: p), high: high)
        }
    }
}

var numbers = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print(numbers)
numbers.quicksort()
print(numbers)

//: [Next](@next)
