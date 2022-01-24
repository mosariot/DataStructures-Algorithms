public func insertionSort<T>(_ collection: inout T)
where T: BidirectionalCollection, MutableCollection, T.Element: Comparable {
    guard array.count >= 2 else { return }
    for current in collection.indices {
        var shifting = current
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            if collection[shifting] < collection[previous] {
                array.swapAt(shifting, previous)
            } else {
                break
            }
            shifting = previous
        }
    }
}
